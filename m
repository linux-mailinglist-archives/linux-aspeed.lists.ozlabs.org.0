Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E1ACF8D42A0
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 03:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QTtAPQh9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqSSL2fDCz7BBD
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 10:54:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QTtAPQh9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqSSF19NJz7B9P
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 10:54:05 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6263F2012A;
	Thu, 30 May 2024 08:54:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030445;
	bh=jucTk2EQ1n2sUx5/LWV9se/pvXVCkWtzGs16Zhspsyo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QTtAPQh99AiaNfgmIUF0m4A/WZjqMBKQt63D53vySo01wzWNpKIFPtCKQaKaO/+Fr
	 d7SoCzo/q94LAO0jRhzz1MPYOTqZfAM6hh2dblbzlGF3D5Gxtbxm1F5W8sEJEySewn
	 PblGOAih5Oqtlpv+DQL5jEFtZNrRmJVe7u8emVhLwoOSRK2CcOZuBZOoz+QpLeuukF
	 hdxQnLx1v9kv1u6GUcvJN9xW2IEXJ9ZstD3zbVJK11dFYXcFZBJZZ83uvJJeIiSK4p
	 A5jY1v1sjpAuQQwVKbJBTVrFmBJ94/48Dp5NfwBAT+BGLTrtKcLDq/UpyQkNHLH5OR
	 BX6Cgb5zezvnQ==
Message-ID: <957a8999b0b0ed31949619913887c944bdae1a9a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 4/4] dt-bindings: gpio: aspeed,sgpio: Require
 #interrupt-cells
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 30 May 2024 10:24:03 +0930
In-Reply-To: <35b39da8-4efd-44ae-bcc1-7f4d501e0873@kernel.org>
References: 	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-4-91c42976833b@codeconstruct.com.au>
	 <35b39da8-4efd-44ae-bcc1-7f4d501e0873@kernel.org>
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-29 at 09:28 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > It shouldn't have been the case that it wasn't required. The kernel
> > devicetrees already specified it where compatible nodes were defined,
> > and u-boot pulls in the kernel devicetrees, so this should have minimal
> > practical impact.
> >=20
>=20
> This should be squashed with previous patch.
>=20

Sure, will do.

Andrew
