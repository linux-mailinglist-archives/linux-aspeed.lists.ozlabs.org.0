Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0B8B891B
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 13:17:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OJXyxVaI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTvg83lmfz3cRr
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 21:17:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OJXyxVaI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTvg12Bsxz2xPZ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 21:17:33 +1000 (AEST)
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9CE720018;
	Wed,  1 May 2024 19:17:29 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714562250;
	bh=3QoSGzlC8U/rzZfHOorehFaN/GCXjRJ7jH7TIi1poEI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OJXyxVaI4mvceq/2q4AwyI8m3zAEOHJ8spq7XZ0JFjm2UDMYSgV2KIWynpBWn/08K
	 rAnNoez1ftcYsilfLKlkvTw2L4AIAEWUXtnOCDDI1v9nnVUVEyj77w9sT78BBSgvkb
	 k8ICI3poEOolgCeJxKHIAobb1K4HruZvMix+Vl3cTv4s+7pCUWSVfeQK83lFpfwaLe
	 Af5pjiD3R+e3QIWlgntXvOmQsQMQDEYEcZxtyZ/6NT0wIsUFb9kPwQANy6hU9AdEgg
	 9oYhuDwNeEHd/sKtEd2dqTqe5S1dvMGjCwY7DybS1LhQsw6gms/cTuG1yhz9NUaK/N
	 hNuYzUR309O7w==
Message-ID: <09ed10182e2282d7e408a4fef7994da010fe058e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: Add nodes for i3c controllers
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Date: Wed, 01 May 2024 19:17:29 +0800
In-Reply-To: <65af46c3-e48f-4eae-8390-2bc01332ccbf@kernel.org>
References: <20240501033832.1529340-1-jk@codeconstruct.com.au>
	 <65af46c3-e48f-4eae-8390-2bc01332ccbf@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLAoKPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQt
ZzYuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1nNi5kdHNp
Cj4gPiBAQCAtODY2LDYgKzg2NiwxMyBAQCBpMmM6IGJ1c0AxZTc4YTAwMCB7Cj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmFuZ2VzID0gPDAgMHgxZTc4YTAwMCAweDEwMDA+Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkzYzogYnVzQDFlN2EwMDAwIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4gCj4gV2hhdCBidXMgaXMgaXQ/IFdoeSBp
cyBpdCBldmVuIG5lZWRlZD8gSWYgaXQgaXMgaTNjLCB0aGVuIGZvciBzdXJlCj4gY29tcGF0aWJs
ZSBpcyB3cm9uZy4KClRoaXMgaXMgbm90IHRoZSBpM2MgYnVzLCBpdCdzIHRoZSBNTUlPIG1hcHBp
bmcgdGhhdCBhbGxvd3MgdXMgdG8gc3BlY2lmeQp0aGUgaW5kaXZpZHVhbCBpM2MgY29udHJvbGxl
ciBtYXBwaW5ncyBhcyBzZW5zaWJsZSBvZmZzZXRzIGludG8gdGhlIG1haW4KYWRkcmVzcyBzcGFj
ZS4gRGlkIHlvdSBtaXNzIHRoZSByYW5nZXMgcHJvcGVydHkgdGhlcmU/CgpUaGlzIGlzIGZvbGxv
d2luZyB0aGUgZXhpc3RpbmcgZGVzaWduIGZvciB0aGUgaTJjIGNvbnRyb2xsZXJzLgoKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI3NpemUtY2VsbHMgPSA8MT47Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByYW5nZXMgPSA8MCAweDFlN2EwMDAwIDB4ODAwMD47Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiArCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmc2ltMDogZnNpQDFlNzliMDAw
IHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWZzaS1tYXN0ZXIiLCAi
ZnNpLW1hc3RlciI7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4MWU3OWIwMDAgMHg5ND47Cj4gPiBAQCAt
MTEyNSwzICsxMTMyLDg5IEBAIGkyYzE1OiBpMmMtYnVzQDgwMCB7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgfTsKPiA+IMKgfTsKPiA+ICsKPiA+ICsmaTNjIHsKPiAKPiA/Pz8/Cj4gCj4gVGhhdCdzIG5v
dCBob3cgd2UgY29uc3RydWN0IERUUy7CoCBPdmVycmlkZXMvZXh0ZW5kcyBvZiBub2RlcyBhcmUg
Zm9yCj4gYm9hcmRzLCBub3Qgd2l0aGluIERUU0kuCgpUaGUgb3ZlcnJpZGVzIGFyZSBvY2N1cnJp
bmcgYXQgdGhlICZpM2NYIGxhYmVscywgbm90ICZpM2MuIFBsYXRmb3JtCmxldmVsIGR0cyBqdXN0
IGNvbm5lY3QgYXQgdGhvc2UgbGFiZWxzIHRvIGRlZmluZSBvdmVycmlkZXMgZm9yIGVhY2ggYnVz
OgoKICAgICZpM2MwIHsKICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwogICAgICAgICAgICBt
Y3RwLWNvbnRyb2xsZXI7CiAgICB9OwoKICAgICZpM2MxIHsKICAgICAgICAgICAgc3RhdHVzID0g
Im9rYXkiOwogICAgICAgICAgICBtY3RwLWNvbnRyb2xsZXI7CiAgICB9OwoKVGhlcmUgaXMgZXhp
c3RpbmcgcHJlY2VkZW5jZSBmb3IgdGhpcyBsYXlvdXQ7IHRoZSBpMmMgYW5kIHBpbmN0cmwKbWFw
cGluZ3MgYWxyZWFkeSB1c2UgZHRzaS1pbnRlcm5hbCBsYWJlbHMuIEl0IGtlZXBzIHRoZSBidXMg
ZGVmaW5pdGlvbnMKbW9yZSBtYW5hZ2VhYmxlLgoKQ2hlZXJzLAoKCkplcmVteQo=

