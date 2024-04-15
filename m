Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0B8A4642
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 02:09:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=giUT0sXr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHnbr0pVsz3dVb
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 10:09:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=giUT0sXr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHnbc6Ssmz30NP
	for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Apr 2024 10:09:32 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0901020178;
	Mon, 15 Apr 2024 08:09:23 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713139768;
	bh=fn0cP6jHQy9x0E71RjlI6piVigamd0rjnbvWW/k3m8c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=giUT0sXrneLxTzQYgCq5jqn57d27IX2/GFoKfYX+JCY8+ofHGvxXcFgdIfpxcmJTn
	 jUmOlCOv3LHdaojgs/5Mzh0YddGrpC/RI8UKg9WasG4onjtXOCgZeJ0JmvkuX7kyBT
	 qz8a8dKkJZTsgtx0O8IXrmztq4QkGmza6igXPyoAJXvC2xE+8+q0QINGwDdgm7rHbw
	 7PxzbgURR818zIPA/v+KFKWEdMy5Lf2/1JBBHWdmvgiAszW21rCh/k5WAW0DihhNrC
	 po1vlz/3HZjNlDp4ySUp8tF886a4EpMd+c9olDGwtPDCt3+Zehl2h+zvYTqRJR6pt7
	 maoIywYca5U8A==
Message-ID: <82fcd7a4532df119f82ea55208f592460ba5358e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/4] dt-bindings: rtc: convert trivial devices into
 dtschema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 15 Apr 2024 09:39:22 +0930
In-Reply-To: <20240413-rtc_dtschema-v3-2-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
	 <20240413-rtc_dtschema-v3-2-eff368bcc471@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 2024-04-13 at 22:22 +0200, Javier Carrasco wrote:
> These RTCs meet the requirements for a direct conversion into
> trivial-rtc:
>=20
> - google,goldfish-rtc
> - maxim,ds1742
> - lpc32xx-rtc
> - orion-rtc
> - rtc-aspeed
> - spear-rtc
> - via,vt8500-rtc
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

We have trailers above but then there's more commit message content
below. Looks like what's below should be trimmed out (bad squash)?
Maybe the trimming could be done as its applied?

>=20
> dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
>=20
> Convert existing binding to dtschema to support validation.
>=20
> Add the undocumented 'clocks' property.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Andrew
