Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E139473FE
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2024 05:52:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XmONgy++;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcjF343fLz3cYh
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2024 13:52:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XmONgy++;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcjDz0WjCz30Vy
	for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Aug 2024 13:52:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722829936;
	bh=TZvll+HrPvEqH8y0dNSmG8aX1CRXxihPJx0XNGZTiG0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XmONgy++mPxu3VFgoGB6JR3uIFqenKM+jkKleyY5t+itipZDhN1oEQI5oxcJUZx9A
	 ql/kTTc//AcRbkmm42wIdjhKPRnIFGerv5d5kjtQOuoqX70UlUceSa0eOBG98iXcwq
	 qFEOnx0ybyvB1x1X4ZWsOvedJ/xTs4s4n/kVky3bbpu6u/jZoypvkKtA4787Q+U2Ki
	 WKepPFMF90e8BdPx1MkxCy3Rbs/2aoKwqQGVx/FzFD+BkJB6xB5UfqRKTw8G27E6xZ
	 sg8PAICL/lvZxWWEYxd/7UaMiGQbCXZc+5k9tolpHEIM760HOLtL7UDTvcmShlgqqc
	 TCdi3toOBzu5Q==
Received: from [192.168.68.112] (ppp14-2-105-65.adl-apt-pir-bras32.tpg.internode.on.net [14.2.105.65])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 73A2465665;
	Mon,  5 Aug 2024 11:52:14 +0800 (AWST)
Message-ID: <1176b2ddb609b462004fa7e7b36fe6657b89bbf0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: catalina: add Meta Catalina BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 05 Aug 2024 13:22:12 +0930
In-Reply-To: <20240802-potin-catalina-dts-v6-2-0b8f61b80688@gmail.com>
References: <20240802-potin-catalina-dts-v6-0-0b8f61b80688@gmail.com>
	 <20240802-potin-catalina-dts-v6-2-0b8f61b80688@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Potin,

On Fri, 2024-08-02 at 17:07 +0800, Potin Lai wrote:
> Add linux device tree entry for Meta(Facebook) Catalina compute-tray
> BMC using AT2600 SoC.
>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>

Running this past checkpatch gave me the following:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Potin Lai <pot=
in.lai.pt@gmail.com>' !=3D 'Signed-off-by: Potin Lai <potin.lai@quantatw.co=
m>'

If you can't send from potin.lai@quantatw.com then perhaps you could
work around this by adding a `From: ...` line as the first line of your
commit message body as documented here:

https://docs.kernel.org/process/maintainer-tip.html#ordering-of-commit-tags

Alternatively, change your S-o-B tag to potin.lai.pt@gmail.com

...=20

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
> new file mode 100644
> index 000000000000..70cec690f541
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
> @@ -0,0 +1,965 @@
>=20

...

> +&gpio0 {
> +	pinctrl-names =3D "default";

Not sure why you need this, but I think it also causes the following
warning:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: gpio@1e780000: '=
pinctrl-0' is a dependency of 'pinctrl-names'

Might be best to drop it.

Andrew
