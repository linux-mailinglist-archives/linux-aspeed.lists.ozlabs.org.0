Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E497C26B
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 03:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8HqV3rdrz2yK9
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:24:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726709060;
	cv=none; b=IqCoSpN6JtsAf8+uSAqgY/yavQNvcJKt5Yl9R0sSjh6F5pQjoQYx1Y4Qv553Bn3TPGS15Uc14AAY/qREolmgfPiy9wXzBDLQtKIRPKUoYiYZ9h4Bn9nIBpMjMbXyVu81PsKVS5k+VI/7mvu30b8ahrflx+/hcwAIyhojWefNVtNQ22NTyQHUc7kqcxX3OOkq6eZHN5BhTn7HBpdB500648LFUh3J8W1YgpZeIzLqZam9E+a6v9XRuaymihSftrCTN5Z+6F9QMUw6SuWSyEK+v7F4LN8AKp0CGTjmN3Ajg+LNpzUPkzmbXm3cYo42LngsTKd4qszwQq9L62sr+oGysg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726709060; c=relaxed/relaxed;
	bh=60FNn73+paJ1b9qXIeVpPKtcaqNLNwtGCQXM+znPqJc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWVyxGtUA8YhpsqoC0SypgvlLfDPA+Yr/Mg4t7o1JA8Iu8ZtvbAHdUX4P3XwTV0DrV/9X5flKS8RH8Lm9XoJmeoG+QexYDF0EuPw+L3qdEa9l8MEbT7k0JDSXH/ISOntXLZrTyln3H5AOywoXUdidx324GDYOAN7vQ0bn5irWCFGPzkI2JAEFBHLwY3dAdau8CdnohY9tJKQkn71XRhNSEbOutkF2tF0BRQjuafsKlfoho79X+oiBPRwpkjRxKhvHWklsGVqE26AjUj+tOnQWQ1uuV/sd3nU+1MOJZMfAAqUVuudQrm0TIlbH0b0sr0MYP/Xm6VwIhzwNkimvceE5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nMlFYnoL; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nMlFYnoL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8HqS1vWyz2xHb
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 11:24:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726709059;
	bh=60FNn73+paJ1b9qXIeVpPKtcaqNLNwtGCQXM+znPqJc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nMlFYnoLPSMfQPySBhM8kfBVbpy4KnB2jzMUy/l6dkNpkQ/NtD8U9lFfMx7BIX4V7
	 WAst1w04ZfSRN3XGN53Gyj3TFq9pvcBTYrlLQK06lXJiHCLApt0vD1K4d53jy/jRon
	 r338KJJdyVSRZ3RnJVCjsaKUlP2idSRxPvfNkXFJbz9A8Cztv2FM5XkUkNMGGjI4vf
	 oR4KaJBplJ6VMAXx9h6JtzxzO1jZtrog00Ztyg2kHKiNjKf3iktT5MRgltf6AbEd4d
	 aVZAvj6r1nsnSTjzblr4Bq0d1Q8MXZZgTh4wFfpzhCvPi0r0FkBz6sxm04kSJz9rFu
	 URs12JW9SFM4g==
Received: from [192.168.238.88] (ppp118-210-188-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5BC0065712;
	Thu, 19 Sep 2024 09:24:18 +0800 (AWST)
Message-ID: <355b19a62e54aa979451d796c3ebe1e294a0cf45.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: support MPS MP5023
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Delphine CC Chiu
 <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Date: Thu, 19 Sep 2024 10:54:17 +0930
In-Reply-To: <bf5258b8-a5a1-4cf3-9bd0-1fa44696c3b0@roeck-us.net>
References: <20240918095438.1345886-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240918095438.1345886-3-Delphine_CC_Chiu@wiwynn.com>
	 <bf5258b8-a5a1-4cf3-9bd0-1fa44696c3b0@roeck-us.net>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Peter Yin <peteryin.openbmc@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Fabio Estevam <festevam@gmail.com>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-09-18 at 10:00 -0700, Guenter Roeck wrote:
> On 9/18/24 02:54, Delphine CC Chiu wrote:
> > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> >=20
> > Add support for hot-swap controller MPS MP5023.
> >=20
> > Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> > --
>=20
> The hardware monitoring mailing list was not copied, so I assume that
> the expectation is that it will be applied through some other tree.

We can take it through the BMC tree, but I'd prefer that the hardware
monitoring list were copied regardless.

Ricky: Please do so for v3 onwards.

Andrew

