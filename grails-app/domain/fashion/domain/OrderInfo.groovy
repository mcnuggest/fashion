package fashion.domain

import org.hibernate.type.descriptor.sql.SmallIntTypeDescriptor

import java.text.DecimalFormat

/**
 * Created by mcnuggest on 16/1/7.
 */
class OrderInfo {
    String id
    Date dateCreated
    Date lastUpdated
    String createUser
    String updateUser

    String orderCode
    String customerID
    Date orderTime
    String totalPrice
    Integer deductionPoint
    String coupondID
    String payPrice
    String deliveryAddressID
    Integer status
    Date payTime
    String paymentID
    Date verifyTime
    Date deliveryTime
    Integer logisticCompany
    String logisticNumber
    Date verifyReceiveTime
    Date closeTime
    String spreaderID

    static constraints = {
        orderCode nullable: false
        customerID nullable: false
        orderTime nullable: false
        totalPrice nullable: false
        payPrice nullable: false
        deliveryAddressID nullable: false
        status nullable: false
        paymentID nullable: false
        createUser nullable: true
        updateUser nullable: true
        deductionPoint nullable: true
        coupondID nullable: true
        payTime nullable: true
        verifyTime nullable: true
        deliveryTime nullable: true
        logisticCompany nullable: true
        logisticNumber nullable: true
        verifyReceiveTime nullable: true
        closeTime nullable: true
        spreaderID nullable: true


    }

    static mapping = {
        id generator: 'uuid.hex'
        columns {
            orderTime type: 'date'
            payTime type: 'date'
            verifyTime type: 'date'
            deliveryTime type: 'date'
            verifyReceiveTime type: 'date'
            closeTime type: 'date'
        }

    }
}
