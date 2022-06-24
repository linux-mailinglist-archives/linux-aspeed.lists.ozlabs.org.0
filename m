Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF3559340
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 08:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTn3t4dKvz3btt
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jun 2022 16:18:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Tk5WWy/w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=99.78.197.217; helo=smtp-fw-80006.amazon.com; envelope-from=prvs=1671e962d=benh@amazon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Tk5WWy/w;
	dkim-atps=neutral
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTn3l5J2cz2yK6
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jun 2022 16:17:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1656051476; x=1687587476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f4Bkp/D0f55yGpotgEdN+5wvSliUUczJ1ffqVAybCo8=;
  b=Tk5WWy/wlAAbMCOhi6AiUTQuoVrYs/flloDGTScoLjF0vbeFJW0lNAaD
   a+LbjOz/syZKbuXgzB3vmvohszEhc98u0T3NRvvGIFGKDzcu5tHd9MGE0
   5Z5fFJv8hLnnQdddq+oN27xVqjH9WpDMh5zIHybnk5IJ8Xt3nsyFBpM9T
   s=;
X-IronPort-AV: E=Sophos;i="5.92,218,1650931200"; 
   d="scan'208";a="101416490"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-b69ea591.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP; 24 Jun 2022 06:17:34 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-b69ea591.us-east-1.amazon.com (Postfix) with ESMTPS id F06E9C1084;
	Fri, 24 Jun 2022 06:17:31 +0000 (UTC)
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Fri, 24 Jun 2022 06:17:31 +0000
Received: from EX13D21UWB003.ant.amazon.com (10.43.161.212) by
 EX13D21UWB003.ant.amazon.com (10.43.161.212) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Fri, 24 Jun 2022 06:17:31 +0000
Received: from EX13D21UWB003.ant.amazon.com ([10.43.161.212]) by
 EX13D21UWB003.ant.amazon.com ([10.43.161.212]) with mapi id 15.00.1497.036;
 Fri, 24 Jun 2022 06:17:31 +0000
From: "Herrenschmidt, Benjamin" <benh@amazon.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	"neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index: AQHYh5IVwI7hc7z5RUWudTZXnLvZ7g==
Date: Fri, 24 Jun 2022 06:17:31 +0000
Message-ID: <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
References: <YrMsU9HvdBm5YrRH@kili>
	 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
	 <20220623064320.GN16517@kadam>
In-Reply-To: <20220623064320.GN16517@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.24]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B17452B6C85AC498D5A839075DB9DF0@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIyLTA2LTIzIGF0IDA5OjQzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBPbiBUaHUsIEp1biAyMywgMjAyMiBhdCAwMTo0MTo0OUFNICswMDAwLCBOZWFsIExpdSB3cm90
ZToNCj4gPiA+IFRoZSBidWcgaXMgdGhhdCB3ZSBzaG91bGQgc3RpbGwgZW50ZXIgdGhpcyBsb29w
IGlmICJ0eF9sZW4iIGlzDQo+ID4gPiB6ZXJvLg0KPiA+ID4gDQo+ID4gPiBBZnRlciBhZGRpbmcg
dGhlICJsYXN0IiB2YXJpYWJsZSwgdGhlbiB0aGUgImNodW5rID49IDAiIGNvbmRpdGlvbg0KPiA+
ID4gaXMgbm8gbG9uZ2VyDQo+ID4gPiByZXF1aXJlZCBidXQgSSBsZWZ0IGl0IGZvciByZWFkYWJp
bGl0eS4NCj4gPiA+IA0KPiA+IA0KPiA+IFVzZSBlaXRoZXIgImNodW5rID49MCIgb3IgImxhc3Qi
Lg0KPiA+IEkgdGhpbmsgdGhlIGZvcm1lciBpcyBtb3JlIHNpbXBsZXIuDQo+IA0KPiBjaHVuayA+
PSAwIGRvZXNuJ3Qgd29yay4gIGxhc3Qgd29ya3MgYnV0IEkgdGhpbmsgdGhpcyB3YXkgaXMgbW9y
ZQ0KPiByZWFkYWJsZS4NCg0KSHJtLi4uIHdoYXQgaXMgdGhhdCBkcml2ZXIgPyBJJ3ZlIG1pc3Nl
ZCBpdCAuLi4gaXMgdGhlIGNvZGUgbGlmdGVkIGZyb20NCmFzcGVlZC12aHViID8gSWYgeWVzLCBz
aG91bGQgd2UgaW5zdGVhZCBtYWtlIGl0IGEgY29tbW9uIGNvZGUgYmFzZSA/DQpBbmQgaWYgdGhl
cmUgYXJlIGJ1ZyBmaXhlcyBvbiBvbmUgdGhleSBtaWdodCBhcHBseSB0byB0aGUgb3RoZXIgYXMN
CndlbGwuLi4NCg0KTmVhbCwgaXMgdGhhdCAiVURDIiBJUCBibG9jayB0aGUgc2FtZSB0aGF0IHJl
c2lkZXMgdW5kZXIgdGhlIHZodWIgPyBJZg0KeWVzIHRoZW4gdGhpcyByZWFsbHkgbmVlZHMgdG8g
YmUgYSBjb21tb24gZHJpdmVyIGluc3RlYWQsIHVzaW5nIHRoZQ0KY29kZSBleGlzdGluZyBpbiBh
c3BlZWQtdmh1Yiwgc2ltcGx5IG1ha2luZyBpdCBhYmxlIHRvIHdvcmsgd2l0aG91dCBhDQpwYXJl
bnQgdmh1YiBwb2ludGVyLg0KDQpDaGVlcnMsDQpCZW4uDQo=
