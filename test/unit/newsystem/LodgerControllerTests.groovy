package newsystem



import org.junit.*
import grails.test.mixin.*

@TestFor(LodgerController)
@Mock(Lodger)
class LodgerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/lodger/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.lodgerInstanceList.size() == 0
        assert model.lodgerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.lodgerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.lodgerInstance != null
        assert view == '/lodger/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/lodger/show/1'
        assert controller.flash.message != null
        assert Lodger.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/lodger/list'

        populateValidParams(params)
        def lodger = new Lodger(params)

        assert lodger.save() != null

        params.id = lodger.id

        def model = controller.show()

        assert model.lodgerInstance == lodger
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/lodger/list'

        populateValidParams(params)
        def lodger = new Lodger(params)

        assert lodger.save() != null

        params.id = lodger.id

        def model = controller.edit()

        assert model.lodgerInstance == lodger
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/lodger/list'

        response.reset()

        populateValidParams(params)
        def lodger = new Lodger(params)

        assert lodger.save() != null

        // test invalid parameters in update
        params.id = lodger.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/lodger/edit"
        assert model.lodgerInstance != null

        lodger.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/lodger/show/$lodger.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        lodger.clearErrors()

        populateValidParams(params)
        params.id = lodger.id
        params.version = -1
        controller.update()

        assert view == "/lodger/edit"
        assert model.lodgerInstance != null
        assert model.lodgerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/lodger/list'

        response.reset()

        populateValidParams(params)
        def lodger = new Lodger(params)

        assert lodger.save() != null
        assert Lodger.count() == 1

        params.id = lodger.id

        controller.delete()

        assert Lodger.count() == 0
        assert Lodger.get(lodger.id) == null
        assert response.redirectedUrl == '/lodger/list'
    }
}
