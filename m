Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D4904B83
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2024 08:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AINfyrMu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzb8Z5pTKz3cdZ
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2024 16:23:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AINfyrMu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzb8S1wXLz3cTx
	for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Jun 2024 16:23:35 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4CE9920178;
	Wed, 12 Jun 2024 14:23:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718173413;
	bh=W4EFvFX49U6Y9KvXa0x4I9f4lLrFWmmzIAAiLK5828s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AINfyrMuIl5OTW62u3yqw2Swna7rpCCxUURx6T2WBPikImU7GUsGSFxFjBK7MwvUt
	 GBw6AG+MCjqLLMoMSTnHp9+ETcO1ks1ov5bZSQgAHcXQHs4siSSB3ZhUJWei8a+G4x
	 Vf/Jet8yGOj+fVipIgIU59olNC5aOZEIojl4/fGfBHbFPTxU05C5mOdhySDiNp5YV+
	 1WcCCmnScQNwSvBQP6rnsVTyjNSC6PCbez3QuicgvKM0SfBIyWj8pTtIXeTsBreVOh
	 L4K/1c7p5rzuXA87zzL7O+oaAp04eXmMI9W36BuD7AERKHdoDy3NfOZkIvFUVAxlpE
	 0mL8PGSD1dcxQ==
Message-ID: <9f2f14979faa5a6d0b17601cfec4988a374ce0c8.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Neal Liu
 <neal_liu@aspeedtech.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>
Date: Wed, 12 Jun 2024 14:23:32 +0800
In-Reply-To: <OS8PR06MB7541C6D06FEC637644BEC5D2F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
	 <OS8PR06MB7541C6D06FEC637644BEC5D2F2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgUnlhbiwKCj4gPiAvKiBNYWluIGNvbmZpZyByZWcgKi8KPiA+IC0jZGVmaW5lIFVEQ19DRkdf
U0VUX0FERFIoeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoKHgpICYgMHgzZikKPiA+IC0jZGVm
aW5lIFVEQ19DRkdfQUREUl9NQVNLwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDNmKQo+
ID4gKyNkZWZpbmUgVURDX0NGR19TRVRfQUREUih4KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgo
eCkgJiBVRENfQ0ZHX0FERFJfTUFTSykKPiA+ICsjZGVmaW5lIFVEQ19DRkdfQUREUl9NQVNLwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdFTk1BU0soNiwgMCkKPiA+IAo+IAo+IEl0IHNob3Vs
ZCBiZSBHRU5NQVNLKDUsMCksIG5vdCBHRU5NQVNLKDYsIDApLCBhbSBJwqAgcmlnaHQ/CgpObywg
dGhhdCB3YXMgdGhlIGJ1Zzogd2UgbmVlZCBiaXRzIDA6NiAoPT0gMHg3ZikgaGVyZS4KCldpdGgg
dGhlIG1hc2sgb2YgMDo1ICg9PSAweDNmKSwgd2UgZG9uJ3QgZ2V0IHRoZSBmdWxsIFVTQiBhZGRy
ZXNzIHNldC4KCkNoZWVycywKCgpKZXJlbXkK

