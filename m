Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2578A4DE
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Aug 2023 06:03:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MitRoMFg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYxkd12dcz3bT8
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Aug 2023 14:03:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=MitRoMFg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::70f; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYxkP1rKKz2ymM
	for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Aug 2023 14:03:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYJ0ZhKpuDLiYzLawO7OiWn00wBSdpIzM75A7UrLPNL9mEGb3wptzokKjjI1+ZnCzwx+xXGIQDIX4hIta8K0/+hGJlzNYyhxhAaoanAkGtCQt/k764/Zk0Kh872h/MFchy4ho4UC3Fu7czF4kLuFBZlJtWg5v3b+pI3IaL1PIKHDzy2h4pSI4KRC2mnJEBMC6dF9z+gJMaE59WHZPUadolhfPSj2B1kpKV87cCNsC3xU2vYyOYQyRWWTXsdCZzs7xjaWJVClYDs5ocv7AtBpFwHlr05X3SlVKFySfcQrE24F8gUobhwn950ltfPsL2kWbHmz86JF8F0LNSMcrRxHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQfU+z3k0csOkFzCr5IaQCPYdiI5TkP6xaGOQ9xQrnA=;
 b=bJ8hLjblN74C2y4xjkl5HOGj2VRUdt9upoQsUwWph193hYxU/WW3EYHCxQIzDQIKqWaieBMKniHUZnHpkjNwg6QGbIrv1jU3L3Dsbl7ZBGKk+FV7p+aRUnrl4Wuiia8e6T+PHLGFemEo1NanB8E+HC2YziKtVUZua5caVukh4cfQu1WXe006NE6tiSCZ08+m/JB2uyGq07Zp8ePHHGXGya90PzO7hzrQez5YcdY4gc5yFUB+kggUp+MxMP4nyZY15LC8KaP5Rw195Hy5QlfYAYPd6zYX0JSqxPNTWaA2iZO12hSMetl7znsuN4cI8rCji298ro5MC4IiGdSY7dQrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQfU+z3k0csOkFzCr5IaQCPYdiI5TkP6xaGOQ9xQrnA=;
 b=MitRoMFgwB1RHJPP+czj1wYFiYi8jdPX7veA5oQAljo4kC8kv1U/BHgTLqVBRHzb/FCea+6C74FKplJ+q934hXw3atjm5xHNnRc+mf7Ef9vokBkU78PyCoIE6UXN/NTYZfWwZJpYGYsrr1wL2X09+x14Wcjvck6ecAM2185ACoe1pf/uWtVfS9ajxdkFONBE8ga/SIfWzX/E78Yy4yAF/sfrmc8b0xckbvMmt1ApDADCMA/aP0MikCdhdhcjVXvjrdVJg6WKfC6LEOnG3PqVithLfRz5eS7OZeVuNwdqaVIIyGq1E4H9oznsi508PZzhI7f7ZieUOWyR56Xj4VmmGQ==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SEZPR06MB6691.apcprd06.prod.outlook.com (2603:1096:101:17d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 04:02:57 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::791a:38e8:18cf:d205]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::791a:38e8:18cf:d205%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 04:02:57 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Thread-Topic: [PATCH v7 1/2] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Thread-Index: AQHZ0QJvt1FcsY++RkyqB+vsZBe3qa/35TgAgADg4iE=
Date: Mon, 28 Aug 2023 04:02:56 +0000
Message-ID:  <SG2PR06MB33659FFB0CBFFA55295E6A098B1DA@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230817120029.221484-1-billy_tsai@aspeedtech.com>
 <20230817120029.221484-2-billy_tsai@aspeedtech.com>
 <20230823131334.GA2059582-robh@kernel.org>
In-Reply-To: <20230823131334.GA2059582-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3365:EE_|SEZPR06MB6691:EE_
x-ms-office365-filtering-correlation-id: d5e57c9d-de83-4d8f-7af9-08dba77ba948
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jlDPzQitzpKOYMDbfhAec1kFPCXxHJtux6nNa0gYEaZoVjOEKNx9R2c0ZeSdJwQ8T9UQfGqbIqY485UYQdziX4AsbqwNJ9sPDge+N5ZfKGJGnPV0s+5VJZvvlFPWvIsApKvWjySh1pED809U6ALDHuhsvqQQKX6IhIlONqyxLBSfDoO0tub8CXyglqLpWJPO4N21hHHOU4NgRALM7sgtxb9Pf9bNnOg5WZ7ncDZD/J1BdMB+asOtbvFMJj723WaKJ6ZD0OEnyoFAT7/rPDqXlNS+VKRVtgfebGR4F+R0+9YmFKw+HFhZsh5QPkhBbiCkhlt2hiGGlLFZHolF11p5du41jtSXlVoXNPFVC95T+FWVMDbJaxzWXgfXiaXxCQZg71tnyRKn7EO5611igYQ/2G8cgTeNb6HoVTgI0L5FvabSjlU34pOrvk5Ek5Cq7ALesugzW58VvTtT1q13bQn1nwI0YLttLYpvWbK7Pj4UE68K9Pf/JxiZn2eWI58ev2h3PENv9y6XgVHBh04n7LXK/9mqL+1EwNRQC4A8tP2naLOAPsd3EWCGGrAPr4aPpkfQ83vC8ZRdupnIsucqMHAD3lfeKjaTakL5JxVuMooER/w=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3365.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39840400004)(346002)(186009)(1800799009)(451199024)(41300700001)(7416002)(122000001)(38100700002)(38070700005)(166002)(86362001)(966005)(83380400001)(478600001)(71200400001)(26005)(107886003)(55236004)(9686003)(7696005)(6506007)(55016003)(76116006)(54906003)(66446008)(2906002)(6916009)(33656002)(316002)(66476007)(64756008)(66556008)(66946007)(5660300002)(8676002)(8936002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Z6279KjnqX4mVBH/wXdiaG6etWJg68KiRtJEnPVaJ08bNmrqSWbiz+fhp/yG?=
 =?us-ascii?Q?7oNxQVJsNRteLFj6KEDmAAc0GGbEfNs9Kx9pCVELFiB5umvSqaOu/fKVcYTs?=
 =?us-ascii?Q?tVmpwWxTH0JaV94YOz8r9gU3JKxxq9AGmU8ivG/8z8XGk5fANeiCRekacsu3?=
 =?us-ascii?Q?qJ5ETXxWG1sG8to/NjHiBH0M2BnzpZCGAh2jKRyjnpcRDnLyj642AK8/HsWQ?=
 =?us-ascii?Q?EmxPKu9GjNdWZh5qlPHsPTjqZGW+WtPBqxd+wlfkFVyaCotdssjel8S3DVWe?=
 =?us-ascii?Q?N1LrG5ZWU/yhN9OuK/1KAcDr3mPhZWiuka8bHrdWYdxvSdjAzbHQSsmMKMr6?=
 =?us-ascii?Q?ui6wqbt9ac+kumql4JjZAC1hmZvGNOPh1tm9yICWP3s5CyETy/pZxMoTMPWR?=
 =?us-ascii?Q?CyHGcjVCwt7RJbHM6TqZX005mHYo4oibBwWVePWb5IXaF+bWvXo5J2DsZ/sm?=
 =?us-ascii?Q?12OAhXSVuPws9fIZ+Bf0ssN8N5DF+azcN0NMMhA5wyFZ0ARWgvlJfnh+fuD8?=
 =?us-ascii?Q?AXiYPi+SYNPC8bnCx2pGnzaCiLEQvfGdrMBh3frZtCqMq8ESo9U7rb7T9qfZ?=
 =?us-ascii?Q?RXIa7meKAShToYVfotFp9cae+2/PZZORv5PP8dYlUhjp+HiZTw44W3DsD0rS?=
 =?us-ascii?Q?TbtyC6ZsNL4LfWdHeLEXt/YKcuOFeYOUHNqE1A3K9nsQR77tULSTpXdJIWee?=
 =?us-ascii?Q?Ar/x9lITWzaUXg94KFwsMX0f6kILurldt39DyCMat2GpndfS0QOjNkdAvU4H?=
 =?us-ascii?Q?xECCCipTx8ecx/Z3xQr/gsx3LUA/5ei0GwwAZi+nT2HxSpAeA9B3fLITlcdj?=
 =?us-ascii?Q?N2aDEGKH6Wnhdd/8PkJGgTID0rRdYXzQQhQaK6s5/byIzBD24qcQJ9FBC9g2?=
 =?us-ascii?Q?PaL7mj6FT0lTLgQb1z7v4V/+zguq6KpqJzGoa42l+8yzvzIJV7eZHgCXHuUg?=
 =?us-ascii?Q?gcCIGNeNjmYFOgYyrT38Jf1m8lDoXCwGMPRvQvWO2xEg1+gpzUK8jMBkwCJb?=
 =?us-ascii?Q?rSh34d9C/cchaXTg4h0D6gFGGEvFU6vN+1QPomX4tarZZnS5INqj3OL8R4ec?=
 =?us-ascii?Q?xrjTFfCyC/OoZciykeR0dR4+TvhUIfYBZAoxQuiIaRhwvbeKTDr2YGJ0wVPM?=
 =?us-ascii?Q?WkBzMqXRWWjd7JNCq8ZBXwbVZkeGDjZaxgofQwjWKbDEJdEN8WZqXTPo2/qb?=
 =?us-ascii?Q?XGJGnNHaS7ZbW87zP9SGup5bk7FY2KVjDwu9mPVLceI+t7xTM+6DiD9rBnLE?=
 =?us-ascii?Q?MO1IxysW2WbOrN0jeySpdYRl/5Ixk8WERDNbhDLe1HtAADENKdClV1gT0YVQ?=
 =?us-ascii?Q?LO9KfS35uZx0lBohtb7Pi1gX7HkELKPLz4P+WGlqA8pRYH/mVNsbRiB8OuL8?=
 =?us-ascii?Q?76JBlTj3iwGOZlmLqW7NEuXGt6LzsgijNZTf3PU2YV1HAR6T8vHZsTZt0TsV?=
 =?us-ascii?Q?lDSJ+jn4+1Uryqez9dqGLcKs0XWIRLyfTPQsbPDkQW29vz4IeOj44zUcqkXD?=
 =?us-ascii?Q?UdPrJSAT1W1XxavriX2m/5xezdDgAaBhdhNbiqbulOpQKNDX0+M1B7jKf9VZ?=
 =?us-ascii?Q?yEwklQ/7mnP1wlejVKsPFsK2BuqrVONDNcxR8ee5IR8Mz4jGcmJN2lrr3dPf?=
 =?us-ascii?Q?xQDgiuMuyv6bsbyQdXjRmQ4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB33659FFB0CBFFA55295E6A098B1DASG2PR06MB3365apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e57c9d-de83-4d8f-7af9-08dba77ba948
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 04:02:56.5510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5z5MK3SRgbDngknMdatwvSZ9xrDQfFYXilszfVNbT1PyztUUZEp164IMPkEUTiIgDAnVMQnOXlXgyH4QBNQbhrhhmlgBqaho4UHN5gP6zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6691
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "corbet@lwn.net" <corbet@lwn.net>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Luke Chen <luke_chen@aspeedtech.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_SG2PR06MB33659FFB0CBFFA55295E6A098B1DASG2PR06MB3365apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 08:00:28PM +0800, Billy Tsai wrote:
>> Document the compatible for aspeed,ast2600-pwm-tach device, which can
>> support upto 16 PWM outputs and 16 fan tach input.
>>
>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>> ---
>>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 57 +++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pw=
m-tach.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.=
yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
>> new file mode 100644
>> index 000000000000..1666304d0b0f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2021 Aspeed, Inc.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ASPEED G6 PWM and Fan Tach controller device driver
>> +
>> +maintainers:
>> +  - Billy Tsai <billy_tsai@aspeedtech.com>
>> +
>> +description: |
>> +  The ASPEED PWM controller can support upto 16 PWM outputs.
>> +  The ASPEED Fan Tacho controller can support upto 16 fan tach input.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - aspeed,ast2600-pwm-tach
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#pwm-cells":
>> +    const: 3
>> +
>> +  aspeed,fan-tach-ch:
>> +    description: Specify the Fan tach input channels.
>> +    $ref: "/schemas/types.yaml#/definitions/uint8-array"

>This property is already defined in aspeed-pwm-tacho.txt as a single u8
>that goes in a fan node. You can't redefine its type and location here.

Hi Rob,

I didn't redefine the type of property. The type of the aspeed,fan-tach-ch =
is unit8-array
in aspeed-pwm-tacho.txt.
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/hwmon/aspeed-pwm-tacho.txt#L48
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/hwmon/aspeed-pwm-tacho.txt#L71

>To repeat what I've said in previous versions, work with others to
>define a common fan and fan controller binding. Otherwise, anything new
>with fan related properties is simply going to be rejected.

Okay I will try to work with Naresh for defining a common fan binding.

Thanks for your suggestion.

Hi Naresh,

As Rob mentioned, it would be advisable for my dt-bindings to reference the=
 common fan bindings instead of introducing specific properties.
I noticed that you have already submitted a related patch to the community,=
 which seems to be pending for around 10 months.
https://lore.kernel.org/lkml/20221116213615.1256297-2-Naresh.Solanki@9eleme=
nts.com/
Do you have plans to send the next version of the patch? Alternatively, can=
 I proceed to cherry-pick this version of the patch and continue with
the upstreaming process in my patch serial?

Thanks
Best Regards,
Billy Tsai

--_000_SG2PR06MB33659FFB0CBFFA55295E6A098B1DASG2PR06MB3365apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-TW" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On Thu, Aug 17, 202=
3 at 08:00:28PM +0800, Billy Tsai wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; Document t=
he compatible for aspeed,ast2600-pwm-tach device, which can<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; support up=
to 16 PWM outputs and 16 fan tach input.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; Signed-off=
-by: Billy Tsai &lt;billy_tsai@aspeedtech.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; ---<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; .../=
bindings/hwmon/aspeed,g6-pwm-tach.yaml&nbsp;&nbsp;&nbsp; | 57 +++++++++++++=
++++++<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; 1 fi=
le changed, 57 insertions(+)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; crea=
te mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.y=
aml<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; diff --git=
 a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Docume=
ntation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; new file m=
ode 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; index 0000=
00000000..1666304d0b0f<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; --- /dev/n=
ull<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +++ b/Docu=
mentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; @@ -0,0 +1=
,57 @@<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +# SPDX-Li=
cense-Identifier: (GPL-2.0-only OR BSD-2-Clause)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +# Copyrig=
ht (C) 2021 Aspeed, Inc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +%YAML 1.2=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +---<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +$id: http=
://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +$schema: =
http://devicetree.org/meta-schemas/core.yaml#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +title: AS=
PEED G6 PWM and Fan Tach controller device driver<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +maintaine=
rs:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; - =
Billy Tsai &lt;billy_tsai@aspeedtech.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +descripti=
on: |<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; Th=
e ASPEED PWM controller can support upto 16 PWM outputs.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; Th=
e ASPEED Fan Tacho controller can support upto 16 fan tach input.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +propertie=
s:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; co=
mpatible:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; enum:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; - aspeed,ast2600-pwm-tach<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; re=
g:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; maxItems: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; cl=
ocks:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; maxItems: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; re=
sets:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; maxItems: 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; &q=
uot;#pwm-cells&quot;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; const: 3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp; as=
peed,fan-tach-ch:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; description: Specify the Fan tach input channels.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp;&nbsp; $ref: &quot;/schemas/types.yaml#/definitions/uint8-array&quot;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;This property i=
s already defined in aspeed-pwm-tacho.txt as a single u8
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;that goes in a =
fan node. You can't redefine its type and location here.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Rob, <o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I didn't redefine t=
he</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"> type of</span><sp=
an style=3D"font-size:11.0pt"> property. The type of the aspeed,fan-tach-ch=
 is unit8-array<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">in aspeed-pwm-tacho=
.txt.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">https://github.com/=
torvalds/linux/blob/master/Documentation/devicetree/bindings/hwmon/aspeed-p=
wm-tacho.txt#L48<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">https://github.com/=
torvalds/linux/blob/master/Documentation/devicetree/bindings/hwmon/aspeed-p=
wm-tacho.txt#L71<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;To repeat what =
I've said in previous versions, work with others to
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;define a common=
 fan and fan controller binding. Otherwise, anything new
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;with fan relate=
d properties is simply going to be rejected.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Okay=
 I will try to work with Naresh for defining a common fan binding.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Than=
ks for your suggestion.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi N=
aresh,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">As R=
ob mentioned, it would be advisable for my dt-bindings to reference the com=
mon fan bindings instead of introducing specific properties.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I no=
ticed that you have already submitted a related patch to the community, whi=
ch seems to be pending for around 10 months.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><a href=3D"https://=
lore.kernel.org/lkml/20221116213615.1256297-2-Naresh.Solanki@9elements.com/=
">https://lore.kernel.org/lkml/20221116213615.1256297-2-Naresh.Solanki@9ele=
ments.com/</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Do y=
ou have plans to send the next version of the patch? Alternatively, can I p=
roceed to cherry-pick this version of the patch and continue with<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">the =
upstreaming process in my patch serial?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best Regards,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Billy Tsai<o:p></o:=
p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_SG2PR06MB33659FFB0CBFFA55295E6A098B1DASG2PR06MB3365apcp_--
