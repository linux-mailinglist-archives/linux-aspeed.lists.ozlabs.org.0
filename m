Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334AA70ACDA
	for <lists+linux-aspeed@lfdr.de>; Sun, 21 May 2023 09:46:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPCMW0zPnz3f6B
	for <lists+linux-aspeed@lfdr.de>; Sun, 21 May 2023 17:46:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com; envelope-from=chen.pj@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 905 seconds by postgrey-1.36 at boromir; Tue, 16 May 2023 19:31:00 AEST
Received: from mail.inventec.com (mail.inventec.com [218.32.67.185])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL9w44tM5z3bmP
	for <linux-aspeed@lists.ozlabs.org>; Tue, 16 May 2023 19:31:00 +1000 (AEST)
Received: from IEC1-EX2016-03.iec.inventec (10.15.2.59) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 17:15:47 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 16 May 2023 17:15:47 +0800
Received: from IEC1-EX2016-02.iec.inventec (IEC1-EX2016-02.iec.inventec [10.1.254.221])
	by IEC1-MSE-FE2.inventec.com with ESMTP id 34G9FhJO052455;
	Tue, 16 May 2023 17:15:43 +0800 (GMT-8)
	(envelope-from Chen.PJ@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 17:15:43 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::ad9c:c1af:d29:f80d]) by
 IEC1-EX2016-01.iec.inventec ([fe80::ad9c:c1af:d29:f80d%7]) with mapi id
 15.01.2507.021; Tue, 16 May 2023 17:15:43 +0800
From: =?big5?B?Q2hlbi5QSiCzr6xmpfQgVEFP?= <Chen.PJ@inventec.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Thread-Topic: [PATCH] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Thread-Index: AQHZh9b9H4korMyllESFK0bWK7oT/Q==
Date: Tue, 16 May 2023 09:15:43 +0000
Message-ID: <c5dd9b64b4754da8b11efefd97527a4f@inventec.com>
References: <28f0ce0a82464083ae24f9ef2f598425@inventec.com>
In-Reply-To: <28f0ce0a82464083ae24f9ef2f598425@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: IEC1-EX2016-01.iec.inventec (15.01.2507.021)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.6.245.192]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 34G9FhJO052455
X-TM-SNTS-SMTP: 	3DB4FA82B12A3F874D9AD0E6CE5DB7C7CED8E01020EE1E34F6EC7C0C85E61F382000:8
X-Mailman-Approved-At: Sun, 21 May 2023 17:46:35 +1000
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
Cc: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>, =?big5?B?SHVhbmcuQWxhbmcgtsCtXq2mIFRBTw==?= <Huang.Alang@inventec.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

RG9jdW1lbnQgdGhlIG5ldyBjb21wYXRpYmxlcyB1c2VkIG9uIEludmVudGVjIHN0YXJzY3JlYW0t
Ym1jDQoNClNpZ25lZC1vZmYtYnk6IENoZW4gUEogPENoZW4ucGpAaW52ZW50ZWMuY29tPg0KLS0t
DQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlh
bWwgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlh
bWwNCmluZGV4IDFiNTg1ZTU1NDc5MS4uZmI0Y2U1ZGYyZmEwIDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1s
DQpAQCAtODIsNiArODIsNyBAQCBwcm9wZXJ0aWVzOg0KICAgICAgICAgICAgICAgLSBpYm0sZXZl
cmVzdC1ibWMNCiAgICAgICAgICAgICAgIC0gaWJtLHJhaW5pZXItYm1jDQogICAgICAgICAgICAg
ICAtIGlibSx0YWNvbWEtYm1jDQorICAgICAgICAgICAgICAtIGludmVudGVjLHN0YXJzY3JlYW0t
Ym1jDQogICAgICAgICAgICAgICAtIGludmVudGVjLHRyYW5zZm9ybWVyLWJtYw0KICAgICAgICAg
ICAgICAgLSBqYWJpbCxyYnAtYm1jDQogICAgICAgICAgICAgICAtIG51dmlhLGRjLXNjbS1ibWMN
Ci0tIA0KMi4yNS4xDQoNCg==
