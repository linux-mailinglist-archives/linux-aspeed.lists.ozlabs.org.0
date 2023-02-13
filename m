Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 335306945E1
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 13:34:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFkLD5zWTz3c7v
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 23:34:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P8VDGGOK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P8VDGGOK;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFkL533B8z2xHT
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 23:34:21 +1100 (AEDT)
Received: from rico.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 276EB20034;
	Mon, 13 Feb 2023 20:34:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676291657;
	bh=AbnhUf2jT5hj7p6JuOOwz4CzqTHAGtxv9hk5Xq/6WcY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P8VDGGOKUiSD67DyMS7WJOrKGYv7fbslE37MxTCXoA3mP9AbvXTkkzWpIG0yMzi3Z
	 Ud2V4L7/dIl52TaAoNr8aK4BOCLf9LV3MMb3qnW+UfvOjOHKfl7xk73RtrHuy9pdrY
	 peP0UHqjNmXZpiAVxodOtScW9D3c7bvx02AZJmQK6ogccIHvOcLkuENcy/LZ8slEJ+
	 Lkwdu30c+XMRQ8C6pojEKfbdWFXKZsLv33/IbfQtJC66KWAwrTU2jhZib2f0GZNQML
	 1d0rXke/b2Ghys8ftaIxr7hSCQIS1M1/vZ/RlM0e/xSrjBE8+V5pShompsXpqdX8ic
	 ivfasQXyH6g0w==
Message-ID: <d58b6170427c9d1414118a0376e98d40f2579b20.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] clk: aspeed: Add full configs for i3c clocks
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 13 Feb 2023 20:34:14 +0800
In-Reply-To: <45ce9e62-2620-b959-985d-ae00b071e350@linaro.org>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
	 <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
	 <45ce9e62-2620-b959-985d-ae00b071e350@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3-1 
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

SGkgS3J6eXN6dG9mLAoKPiBCaW5kaW5ncyBhcmUgYWx3YXlzIHNlcGFyYXRlIHBhdGNoZXMuCgpP
SywgSSdsbCBzcGxpdCB0aGVzZSB1cCBpbnRvIHRoZSBkdC1iaW5kaW5ncyBhbmQgdGhlIGNsayBj
aGFuZ2VzLgoKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2
MDAtY2xvY2suaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oCj4g
PiBpbmRleCBkOGIwZGIyZjdhN2QuLjYwMDU0OWQ3YmVlOCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oCj4gPiArKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2suaAo+ID4gQEAgLTU3LDggKzU3LDYgQEAKPiA+
IMKgI2RlZmluZSBBU1BFRURfQ0xLX0dBVEVfSTNDM0NMS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgNDAKPiA+IMKgI2RlZmluZSBBU1BFRURfQ0xLX0dBVEVfSTNDNENMS8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgNDEKPiA+IMKgI2RlZmluZSBBU1BFRURfQ0xLX0dBVEVf
STNDNUNMS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgNDIKPiA+IC0jZGVmaW5lIEFT
UEVFRF9DTEtfR0FURV9JM0M2Q0xLwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA0Mwo+
ID4gLSNkZWZpbmUgQVNQRUVEX0NMS19HQVRFX0kzQzdDTEvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDQ0Cj4gCj4gVGhpcyBpcyBhbiBBQkkgYnJlYWsgYW5kIGNvbW1pdCBtc2cgZG9l
cyBub3QgcmVhbGx5IGp1c3RpZnkgaXQuCgpJJ2xsIGFkZCBtb3JlIHJhdGlvbmFsZSB0aGVyZS4K
CkNoZWVycywKCgpKZXJlbXkKCg==

