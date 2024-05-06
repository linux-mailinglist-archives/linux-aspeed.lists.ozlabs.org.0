Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA148BCF61
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 May 2024 15:47:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bwo2UIIj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY2lF2Vcpz3bmY
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 May 2024 23:47:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bwo2UIIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY2l523MFz30Tv
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 May 2024 23:46:56 +1000 (AEST)
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B13A62009E;
	Mon,  6 May 2024 21:46:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715003215;
	bh=2fhzb0hzM5CoC8a/Hka9EaoE507VJeZDLIbAnWrjUbc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bwo2UIIjoltuTMynVf0nfgO+i7rXvZ4kRTueU/ZTz4FjuAxtap4hBzajaFDed0WMa
	 kNpCyzWGAQmuISBjc32x5sOskt7mPcIUPaPbEV0wFzDEHuVCV4Ak26gDCnBpDt17sJ
	 O9FLFfdxTnW9TyBhVo6w1env8+YTqOcTYEYqVX+I+x5pbpBOEnAqAnJv+6K1oLeK/N
	 67xNd7N3f9C/AhtK3PK/J9F9dvTz427MH5CD8FSu6xY/qSVSzPLNfs0KSUayN/Y0S4
	 /EGKzAiakLl16imLL3GWlxPDZz/o4GqcbCqec+PSb9blfm3cwDtgdQ6RhJqBDNE1G7
	 kpmh4eOKIRqLg==
Message-ID: <42ec2da02cc1260fd1c05bdeb620f770c8ecc767.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] [RFC] i3c: ast2600: Add MCTP-over-I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au,  alexandre.belloni@bootlin.com,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
Date: Mon, 06 May 2024 21:46:50 +0800
In-Reply-To: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
References: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Dylan,

> Add Aspeed AST2600 I3C controllers and add minimal changes to
> validate
> the functionality for MCTP-over-I3C.
>=20
> Dylan Hung (2):
> =C2=A0 [RFC] ARM: dts: aspeed-g6: Add AST2600 I3Cs

I'd sent a similar patch earlier:

  https://lists.ozlabs.org/pipermail/linux-aspeed/2024-May/012193.html

And a v2 to account for some feedback on the dts layout:

  https://lists.ozlabs.org/pipermail/linux-aspeed/2024-May/012213.html

> =C2=A0 [RFC] i3c: ast2600: Validate AST2600 I3C for MCTP-over-I3C

Looks interesting, I'll check this out soon.

Cheers,


Jeremy
