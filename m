Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6731C4BA8
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 May 2020 03:54:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GN7k0xbyzDqZn
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 May 2020 11:54:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GN5H1R74zDqXS;
 Tue,  5 May 2020 11:52:18 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0451fnFT030573;
 Tue, 5 May 2020 09:41:49 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 May
 2020 09:52:04 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 May
 2020 09:52:02 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 5 May 2020 09:52:02 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Wolfram Sang
 <wsa@the-dreams.de>
Subject: RE: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Topic: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Index: AQHWHdeQ1mqTBOPAdE+n+yVhmYVsFKiPNOCAgACLErD//4h6gIABsZgAgAfJrwA=
Date: Tue, 5 May 2020 01:52:01 +0000
Message-ID: <fc8bc729af844e658fd1ac1f86480f00@TWMBX02.aspeed.com>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
 <20200429075357.GA1957@kunai>
 <56add9c6e6b5410986325a1360466e4b@TWMBX02.aspeed.com>
 <20200429090355.GA2891@kunai>
 <232b9fac588beb4d024ab496b118c51af2b0ecba.camel@kernel.crashing.org>
In-Reply-To: <232b9fac588beb4d024ab496b118c51af2b0ecba.camel@kernel.crashing.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0451fnFT030573
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

PiA+IEFuZCBpcyB0aGVyZSBtYXliZSBhIEZpeGVzOiB0YWcgZm9yIGl0Pw0KPiA+IFtSeWFuIENo
ZW5dIFllcyBpdCBpcyBhIGZpeCBwYXRjaC4NCj4gDQo+IEkgbWVhbnQgdGhpcyAoZnJvbSBzdWJt
aXR0aW5nLXBhdGNoZXMucnN0KToNCg0KPkl0IGZpeGVzIHRoZSBvcmlnaW5hbCBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgZHJpdmVyIGJhc2ljYWxseS4gSXQncyBqdXN0IGEgY2xhc3NpYyBwb3N0ZWQt
d3JpdGUgZml4LiBUaGUgd3JpdGUgdG8gY2xlYXIgdGhlIHBlbmRpbmcgaW50ZXJydXB0IGlzIGFz
eW5jaHJvbm91cywgc28geW91IGNhbiBnZXQgc3B1cnJpb3VzIG9uZXMgaWYgeW91IHJldHVybiBm
cm9tIHRoZSBoYW5kbGVyIGJlZm9yZSBpdCBoYXMgcGVyY29sYXRlZCB0byB0aGUgSFcuDQoNCj5J
IGFzc3VtZSBpdCdzIGp1c3QgbW9yZSB2aXNpYmxlIG9uIHRoZSAyNjAwIGJlY2F1c2Ugb2YgdGhl
IGNvcmVzIGFyZSBzaWduaWZpY2FudGx5IGZhc3RlciBidXQgdGhlIElPIGJ1cyBpcyBzdGlsbCBh
cyBkdW1iLg0KDQo+UnlhbjogWW91IGNvdWxkIGFsd2F5cyBhZGQgYSBGaXhlZC1ieTogdGFnIHRo
YXQgc3BlY2lmaWVzIHRoZSBjb21taXQgdGhhdCBhZGRlZCB0aGUgaW5pdGlhbCBkcml2ZXIuLi4N
CltSeWFuIENoZW5dIFRoYW5rcyBCZW4uDQoNCg==
