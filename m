Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9319182A5
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:37:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LxeuTmCZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8N6p2s9Vz3cT1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:37:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LxeuTmCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8N6j5WQDz3c5J
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:37:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4895FCE21DE
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 13:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B9BC32782
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719409052;
	bh=As0Bh7KDJUH3zjAni78IqOcOnk5zwOW4rEU9qn+ia38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxeuTmCZHUH/qbBAmhMOI4SSYSbx80xItazS3xwQke1kJkMGpDjfJMZaqVF9K7TtQ
	 Adg+qffBvAfo+yBA/aNae7YyabkEceAFXtEed0ova8MZJ2/3FgiGh/JwDVogDW5Cnx
	 TKiZ+nVcKvH462VwSINy0a4ql2F2R1DdYXJewiHT5+m1AHIKq6fTuDmu+0VROEGSvL
	 4x88eI4pxk//IFE3wtrwzZG+rDrYvRSIe1k/EZ+ZZ/rhDgysgiJwUjNHzu7TRhiIJM
	 etXd4nN56zWmHRihBRaXowHhI9WkyywS73vCAyJn25UaIxZy1DnWcjjXINPeA/MMYy
	 jab068L7muXlA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso1434074e87.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyFSSf4jT7PvQnfpeu3BDRfhZhdED/0wYyLzpiyRiqAEctvU71un5vxLWFRX5xIZ7MQ8xPUmND50Ec1MxadClUMMLHJYJMNlB5lU7VXA==
X-Gm-Message-State: AOJu0YzGk0g8IRvvuz0E03Okf4NMT8v1a0DsGPu4EVVApkXzjL1Artyy
	YF2J4SQdr51lh0bHQA5UN9mDaDx4nWEStx5ZupIovgB6ptAh4P2sC6GYrBw5C99vmkNASiYC0b+
	9txCrsrdqH8s4IMxHTF3QhXJmzw==
X-Google-Smtp-Source: AGHT+IEdo1EwuO6AMJ8bC+vU4ucHZMLDoHvU4PJwBzq73H4xZeA4eiWmU/5LP9RQuRzcWgNIUJTVvO7Jkop0LJ0ijJg=
X-Received: by 2002:ac2:59c6:0:b0:529:ed29:dc94 with SMTP id
 2adb3069b0e04-52ce0641428mr8222345e87.44.1719409050558; Wed, 26 Jun 2024
 06:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240626090744.174351-1-Delphine_CC_Chiu@wiwynn.com> <20240626090744.174351-4-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240626090744.174351-4-Delphine_CC_Chiu@wiwynn.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Jun 2024 07:37:18 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+A_+P21raZKKKVxrXNfUt9hvFLghZs5LZSQBp1Jgp=dg@mail.gmail.com>
Message-ID: <CAL_Jsq+A_+P21raZKKKVxrXNfUt9hvFLghZs5LZSQBp1Jgp=dg@mail.gmail.com>
Subject: Re: [PATCH v9 03/26] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 3:08=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> enable spi-gpio setting for spi flash

I don't see a flash device added.

>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index dd88be47d1c8..effc2af636a4 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -53,6 +53,24 @@ iio-hwmon {
>                                 <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7=
>,
>                                 <&adc1 0>, <&adc1 1>, <&adc1 7>;
>         };
> +
> +       spi_gpio: spi-gpio {
> +               compatible =3D "spi-gpio";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-sck =3D <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
> +               gpio-mosi =3D <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>=
;
> +               gpio-miso =3D <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>=
;

Not the right properties for GPIOS. Run 'make dtbs_check' on your DT files.

> +               num-chipselects =3D <1>;
> +               cs-gpios =3D <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> +
> +               tpmdev@0 {

tpm@0

> +                       compatible =3D "tcg,tpm_tis-spi";
> +                       spi-max-frequency =3D <33000000>;
> +                       reg =3D <0>;
> +               };
> +       };
>  };
>
>  &uart1 {
> --
> 2.25.1
>
>
