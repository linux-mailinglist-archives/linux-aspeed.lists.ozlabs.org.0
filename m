Return-Path: <linux-aspeed+bounces-1101-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C9EA6B295
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Mar 2025 02:17:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJl151W2Sz2yVX;
	Fri, 21 Mar 2025 12:17:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742519849;
	cv=none; b=AONjJa/aCnX2AiBLM/C9pJHkvHcNrmMJiDCvrVUWrRg2asQtDMwLR+g6mq4FmgPAqCTYVFuS62T9CyVQZ/FYNvwO3tVez9hleUsE0B9pkDsKgxLr1R2tnp/ufZGK+Mv9fnMOKDTVdud9MZltIQEtDHGGhW/Gj+iww/5PrjoOuVF9huT+hadJkjr2PQepbv1KsNAaUGIBbETntNDI9GCLtXWXMDCymMEBFxOh3EYkGq8GWnl0ksyeW/0kX8exM1Bpohjxb0O/wToRy6Cz2s7c5PjIvgpLET42z08kyE6dWFsDrEdGTMzsFuxqRyFmPuMFbeyzJEqQwiZvemGigrkQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742519849; c=relaxed/relaxed;
	bh=3gAbyuISuqa5pnBiQR//72WrRmt0RCFEDOdo2QdTYT0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4dugz4KMwiHuQB0Y6VAHu6mTftjdvy1zcoDXaAJxuSyjao0vfx4TRMo4JQFPijLuO4RB8hFqg37hXNXH38EVYNsLEoLleMGexK8bVDsN0zWO2ASgc/lwVMg/USuYvgWCsahcWRaYyMfqicwvTzKcadBbZerkdtaJzW4yPmExz4tUXeXZWkuk3UKpnFuD52y2dKM3L0bEmnpjMCs0FTgn4PV5n94Ez6Ht25I4GtewwmC9M11S+LnsvFtC3KgZQBgC6NYXxe2DWntsWcz/TvfpZtTUlZJ7seFLhY3yiUPtIqT3JMsTubCoqFRQlkt06dckX/Lm8blJKQzbahXnR1jpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CF9LrEaW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CF9LrEaW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJl110sj4z2yTP
	for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Mar 2025 12:17:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742519844;
	bh=3gAbyuISuqa5pnBiQR//72WrRmt0RCFEDOdo2QdTYT0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CF9LrEaW73SSkAvONjb7ZeJumWBWYxoLQjntgCqAddTkQMb+6W3Ef9L9xMutrChWF
	 4M3NhEapu1XqbGp4r43Mk9FvfQZcYgdC0PQx74HpzalW6cP4ICJXXFqD8D0H4rsLb5
	 3wGvehiN82krX48aekEAXVTTltdltypLJydQcmZhkqOAgdHJQHEipk0uZfE+jVVICP
	 +r1i21k+oLgLe0VA+h4AvyC+LFRGYmJuZhRuMKbdnTwcr+uVt/eBFfERxq6f55lGN3
	 aKAkmbSbRsBYhxkDscaApAlbXAzbJc2A/+BKBNtV9WsLTR8XUTESe8xIWW/RoiOVu+
	 hq8h5S6RvwoFw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5C53E7A886;
	Fri, 21 Mar 2025 09:17:23 +0800 (AWST)
Message-ID: <26a1d17c47c5ca6036dd58ac3b953daeec9f5ef8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 05/10] ARM: dts: aspeed: catalina: Add second source
 fan controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Date: Fri, 21 Mar 2025 11:47:22 +1030
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-5-e161be6583a7@gmail.com>
References: 
	<20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
	 <20250320-potin-catalina-dts-update-20250102-v5-5-e161be6583a7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgUG90aW4sCgpPbiBUaHUsIDIwMjUtMDMtMjAgYXQgMjM6MjEgKzA4MDAsIFBvdGluIExhaSB3
cm90ZToKPiBBZGQgZGV2aWNlIHRyZWUgbm9kZXMgZm9yIHRoZSBOQ1Q3MzYzIGZhbiBjb250cm9s
bGVycyBvbiB0aGUgc2Vjb25kLQo+IHNvdXJjZQo+IFBvd2VyIERpc3RyaWJ1dGlvbiBCb2FyZCAo
UERCKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQb3RpbiBMYWkgPHBvdGluLmxhaS5wdEBnbWFpbC5j
b20+Cj4gLS0tCj4gwqAuLi4vZHRzL2FzcGVlZC9hc3BlZWQtYm1jLWZhY2Vib29rLWNhdGFsaW5h
LmR0c8KgwqDCoCB8IDc2Cj4gKysrKysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDc2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2stCj4gY2F0YWxpbmEuZHRzIGIvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2stCj4gY2F0YWxpbmEuZHRzCj4gaW5kZXgg
ZmQyMmFkZDkwNDQ5Li45Y2JiMjk2ZGNkOWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2stY2F0YWxpbmEuZHRzCj4gKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1ibWMtZmFjZWJvb2stY2F0YWxpbmEuZHRzCj4gQEAg
LTQ2Nyw2ICs0NjcsODIgQEAgaTJjMW11eDBjaDI6IGkyY0AyIHsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjc2l6ZS1jZWxscyA9IDwwPjsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8MHgyPjsK
PiDCoAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaHdt
b24wOiBod21vbkAxIHsKClRoZXJlIG1pZ2h0IGJlIGluc3RhbmNlcyBvZiBjYWxsaW5nIG5vZGVz
IGFuZCBsYWJlbHMgJ2h3bW9uJyBpbiBvdGhlcgooQk1DKSBkZXZpY2V0cmVlcywgYnV0IEkgZG9u
J3QgdGhpbmsgd2Ugc2hvdWxkIGNvbnRpbnVlIHRoYXQgcHJhY3RpY2UuCkkgdGhpbmsgaW4gdGhp
cyBjYXNlIGl0IHNob3VsZCBiZSAnZmFuLWNvbnRyb2xsZXInLgoKaHdtb24gaXMgdGhlIG5hbWUg
b2YgYSBrZXJuZWwgc3Vic3lzdGVtLCBub3QgYSBjbGFzcyBvZiBoYXJkd2FyZS4gVGhlCmRldmlj
ZXRyZWVzIHNob3VsZCBkZXNjcmliZSB0aGUgaGFyZHdhcmUgKGFuZCBub3QgY29uY2VwdHMgZnJv
bSB0aGUKa2VybmVsKS4KCgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAibnV2b3RvbixuY3Q3MzYzIjsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZWcgPSA8MHgwMT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI3B3bS1jZWxscyA9IDwyPjsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZmFuLTkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwd21zID0gPCZod21vbjAgMCA0MDAw
MD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRhY2gtY2ggPSAvYml0cy8gOCA8MHgwOT47Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBmYW4tMTEgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwd21zID0g
PCZod21vbjAgMCA0MDAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRhY2gtY2ggPSAvYml0
cy8gOCA8MHgwYj47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmYW4tMTAgewo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBwd21zID0gPCZod21vbjAgNCA0MDAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHRhY2gtY2ggPSAvYml0cy8gOCA8MHgwYT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmYW4tMTMgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwd21zID0gPCZod21vbjAgNCA0MDAwMD47Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHRhY2gtY2ggPSAvYml0cy8gOCA8MHgwZD47Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmYW4tMTUgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwd21zID0gPCZod21vbjAgNiA0
MDAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRhY2gtY2ggPSAvYml0cy8gOCA8MHgwZj47
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgfTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBmYW4tMSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB3bXMg
PSA8Jmh3bW9uMCA2IDQwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGFjaC1jaCA9IC9i
aXRzLyA4IDwweDAxPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZhbi0wIHsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcHdtcyA9IDwmaHdtb24wIDEwIDQwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdGFjaC1jaCA9IC9iaXRzLyA4IDwweDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZhbi0zIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHdtcyA9IDwmaHdtb24wIDEwIDQwMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdGFjaC1jaCA9IC9iaXRzLyA4IDwweDAzPjsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGh3bW9uMTogaHdtb25A
MiB7CgpBcyBhYm92ZS4KCkFuZHJldwo=


