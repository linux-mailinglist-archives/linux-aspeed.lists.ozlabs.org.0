Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2533164E4
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 12:17:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbHKm4VC0zDsjy
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 22:17:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UqGoRLdV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbHKM1RxdzDr6c
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 22:17:10 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11ABD2KL165563; Wed, 10 Feb 2021 06:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=bVIRlUcW1nwYMH4p2dPZP5TL5zFGPE6B4Vi1aqOvjlw=;
 b=UqGoRLdVUWcHOZT7R1B/Rsl0w1CmZaNBvEgmUaDlvZtEzGpOyBQAbKq1+H1wVv7JArp9
 N6TPAHbytFYGWJt/kBkBR5jQfu1CasxcyQjhzNI7YA2vgUu3SpxebuV91P+ATwgsDWQh
 vmbeacGeHVE9caMaUs/JBLd9cRUKb6R+Td1VF758PG2KQcTD5pglu+lZHjGcJfIdjiG3
 owLzq0ikCR0VVt/3840dTSZ1jEV36LdYkMWBV4xryJyMnZf1QKEG27bbCCbcB9UE60ZR
 IO2QlEwzbp7cU7ONi1tHxWZzxbOogU4wGr4P7JIm8iV+NzdafKvXFRFkDJTjfknG+paJ vw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36medt034p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 06:17:03 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11ABFSRB018037;
 Wed, 10 Feb 2021 11:17:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 36hjr82edg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 11:17:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11ABGnVL26149368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 11:16:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7046F52057;
 Wed, 10 Feb 2021 11:16:59 +0000 (GMT)
Received: from [9.85.100.242] (unknown [9.85.100.242])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id F15AF52051;
 Wed, 10 Feb 2021 11:16:57 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: rainier: Add leds that are on
 optional PCI cable cards
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <CACPK8XfttMptuYFsocBaj2v4z1vzNjDUfe18FeDcAbmZjWKjfQ@mail.gmail.com>
Date: Wed, 10 Feb 2021 16:46:57 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6CFB3D8D-CF5A-4E33-8D57-6A4034DDC49E@linux.vnet.ibm.com>
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-6-git-send-email-vishwa@linux.vnet.ibm.com>
 <CACPK8XfttMptuYFsocBaj2v4z1vzNjDUfe18FeDcAbmZjWKjfQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_03:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102100104
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



> On 16-Nov-2020, at 11:43 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Fri, 13 Nov 2020 at 05:59, Vishwanatha Subbanna
> <vishwa@linux.vnet.ibm.com> wrote:
>>=20
>> These are LEDs on the cable cards that plug into PCIE slots.
>> The LEDs are controlled by PCA9552 I2C expander
>>=20
>> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>> ---
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 288 =
+++++++++++++++++++++++++++
>> 1 file changed, 288 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index 67c8c40..7de5f76 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -696,6 +696,70 @@
>>                        gpios =3D <&pca4 7 GPIO_ACTIVE_LOW>;
>>                };
>>        };
>> +
>> +       leds-optional-cablecard0 {
>=20
> Is it necessary to have separate nodes for each of the different GPIO =
devices?
>=20
> Would it make sense to combine them, or is it better to be separate?
>=20
> Andrew, Eddie, Brad: please review this one before I merge it.

I answered this in previous patch set.  If I express =E2=80=98em all in =
one node that is =E2=80=9Cleds {", then if any of the GPIO is not seen =
because of not having the card, then the current leds-gpio driver knocks =
off all the ones on which it successfully acquired the GPIOs also, =
leaving nothing. I did speak to the maintainer and it looked like the =
behaviour was existing since long time and changing it would break old =
code.


>=20
>> +               compatible =3D "gpio-leds";
>> +
>> +               cablecard0-cxp-top {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca5 0 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               cablecard0-cxp-bot {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca5 1 GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +
>> +       leds-optional-cablecard3 {
>> +               compatible =3D "gpio-leds";
>> +
>> +               cablecard3-cxp-top {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca6 0 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               cablecard3-cxp-bot {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca6 1 GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +
>> +       leds-optional-cablecard4 {
>> +               compatible =3D "gpio-leds";
>> +
>> +               cablecard4-cxp-top {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca7 0 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               cablecard4-cxp-bot {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca7 1 GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> +
>> +       leds-optional-cablecard10 {
>> +               compatible =3D "gpio-leds";
>> +
>> +               cablecard10-cxp-top {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca8 0 GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               cablecard10-cxp-bot {
>> +                       retain-state-shutdown;
>> +                       default-state =3D "keep";
>> +                       gpios =3D <&pca8 1 GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>> };
>>=20
>> &ehci1 {
>> @@ -1212,6 +1276,180 @@
>>                compatible =3D "atmel,24c64";
>>                reg =3D <0x52>;
>>        };
>> +
>> +       pca5: pca9551@60 {
>> +               compatible =3D "nxp,pca9551";
>> +               reg =3D <0x60>;
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +
>> +               gpio-controller;
>> +               #gpio-cells =3D <2>;
>> +
>> +               gpio@0 {
>> +                       reg =3D <0>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@1 {
>> +                       reg =3D <1>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@2 {
>> +                       reg =3D <2>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@3 {
>> +                       reg =3D <3>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@4 {
>> +                       reg =3D <4>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg =3D <5>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg =3D <6>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg =3D <7>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>> +};
>> +
>> +&i2c5 {
>> +       status =3D "okay";
>> +
>> +       tmp275@48 {
>> +               compatible =3D "ti,tmp275";
>> +               reg =3D <0x48>;
>> +       };
>> +
>> +       tmp275@49 {
>> +               compatible =3D "ti,tmp275";
>> +               reg =3D <0x49>;
>> +       };
>> +
>> +       eeprom@50 {
>> +               compatible =3D "atmel,24c64";
>> +               reg =3D <0x50>;
>> +       };
>> +
>> +       eeprom@51 {
>> +               compatible =3D "atmel,24c64";
>> +               reg =3D <0x51>;
>> +       };
>> +
>> +       pca6: pca9551@60 {
>> +               compatible =3D "nxp,pca9551";
>> +               reg =3D <0x60>;
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +
>> +               gpio-controller;
>> +               #gpio-cells =3D <2>;
>> +
>> +               gpio@0 {
>> +                       reg =3D <0>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@1 {
>> +                       reg =3D <1>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@2 {
>> +                       reg =3D <2>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@3 {
>> +                       reg =3D <3>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@4 {
>> +                       reg =3D <4>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg =3D <5>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg =3D <6>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg =3D <7>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>> +
>> +       pca7: pca9551@61 {
>> +               compatible =3D "nxp,pca9551";
>> +               reg =3D <0x61>;
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +
>> +               gpio-controller;
>> +               #gpio-cells =3D <2>;
>> +
>> +               gpio@0 {
>> +                       reg =3D <0>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@1 {
>> +                       reg =3D <1>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@2 {
>> +                       reg =3D <2>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@3 {
>> +                       reg =3D <3>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@4 {
>> +                       reg =3D <4>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg =3D <5>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg =3D <6>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg =3D <7>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>> };
>>=20
>> &i2c5 {
>> @@ -2028,6 +2266,56 @@
>>                compatible =3D "atmel,24c64";
>>                reg =3D <0x51>;
>>        };
>> +
>> +       pca8: pca9551@60 {
>> +               compatible =3D "nxp,pca9551";
>> +               reg =3D <0x60>;
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +
>> +               gpio-controller;
>> +               #gpio-cells =3D <2>;
>> +
>> +               gpio@0 {
>> +                       reg =3D <0>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@1 {
>> +                       reg =3D <1>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@2 {
>> +                       reg =3D <2>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@3 {
>> +                       reg =3D <3>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@4 {
>> +                       reg =3D <4>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg =3D <5>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg =3D <6>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg =3D <7>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>> };
>>=20
>> &i2c12 {
>> --
>> 1.8.3.1
>>=20

