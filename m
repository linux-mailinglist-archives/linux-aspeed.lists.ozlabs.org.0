Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7189182B2
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:38:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hyTMMWyD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8N7y5Lbyz3cTb
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:38:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hyTMMWyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8N7s3PvDz3c5J
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:38:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE64DCE21E1
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 13:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59886C4AF0E
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719409107;
	bh=mT+XvH8UWizqo1I9e1vZwDFAL61b089M6KvtdSkZlYQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hyTMMWyDWl7i3UzJAOekCXQecATrQ1qOiavEK07g6HN1P2ioQLTk8Jj6i3HJtwdfr
	 8A4/oYETPSakxgQYGyOOHr0piXrCzEgS04Agpe6dUdPZ9iO/7tLqAIoPKwwxLYWSaH
	 8EuuLOWd7MP8juGF0zwDzv+zmEoz6Bbk6E3XAuUSToYXTQLUl14ZjTdY+SDtfbjmPG
	 3jjP2/sQy85YPVcdmk4LmgJVcO4KMvclq01JW9YzMlX6xsTYWOY+1YyBDrpmOT+P6a
	 aGI+hzRjpI2ja785xRIX87IgECypRAoDPgLSuVaQTcDlhLqRdD36jQFyyKzuKvIngb
	 h0kmuKG4RPBcg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so6084482e87.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyA+LJ/Ed+lg9rs94d85zUTJYtANCZXOFZTcO+eYl4ArqiC1fj4LNrmQE7ZCBA7IWPfn1cjEV6CgjzqQTq6pYj3OskSsstgT0QlSb5dg==
X-Gm-Message-State: AOJu0Ywgcnw7ZJxMXss/7y4gTFyEteX2fLeFG0Jr/kPDD4I21mROH9jL
	g9GQPper5zPmIPUsacph95YwEFbU9q+UHd1FkKmaKHR9WKnrsuzTOPTbdRr9Xzm+7S/AyjY7NDV
	mf9HoGSdPBUQVrJhdQ6/KYU0M8w==
X-Google-Smtp-Source: AGHT+IEsX6qXOl6xVez/XAXXEykZ0DqynORMkATY30RgaD9BFgyHKzmt9KjRBpXz2UGDbbrSY43FLqrTUosq3vLwFQI=
X-Received: by 2002:a05:6512:ba1:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-52ce185fa38mr8425545e87.44.1719409105710; Wed, 26 Jun 2024
 06:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Jun 2024 07:38:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-b==HMLJGd_e-43yZHjBFYrrLV5J2a=E2LSEck=ii6w@mail.gmail.com>
Message-ID: <CAL_JsqL-b==HMLJGd_e-43yZHjBFYrrLV5J2a=E2LSEck=ii6w@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] Revise Facebook Minerva BMC DTS
To: Yang Chen <yangchen.openbmc@gmail.com>
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 7:05=E2=80=AFAM Yang Chen <yangchen.openbmc@gmail.c=
om> wrote:
>
> Revise the Linux device tree entry related to Facebook platform Minerva
> specific devices connected to the Aspeed AST2600 BMC.
>
> Changelog:
> - v1:

You already sent v1. This is v2.

>   - Modify the properties of spi to match the schema.
>
> Yang Chen (17):
>   ARM: dts: aspeed: minerva: change the address of tmp75
>   ARM: dts: aspeed: minerva: change aliases for uart
>   ARM: dts: aspeed: minerva: add eeprom on i2c bus
>   ARM: dts: aspeed: minerva: change RTC reference
>   ARM: dts: aspeed: minerva: enable mdio3
>   ARM: dts: aspeed: minerva: remove unused bus and device
>   ARM: dts: aspeed: minerva: Define the LEDs node name
>   ARM: dts: aspeed: minerva: Add adc sensors for fan board
>   ARM: dts: aspeed: minerva: add linename of two pins
>   ARM: dts: aspeed: minerva: enable ehci0 for USB
>   ARM: dts: aspeed: minerva: add tmp75 sensor
>   ARM: dts: aspeed: minerva: add power monitor xdp710
>   ARM: dts: aspeed: minerva: revise sgpio line name
>   ARM: dts: aspeed: minerva: Switch the i2c bus number
>   ARM: dts: aspeed: minerva: remove unused power device
>   ARM: dts: aspeed: minerva: add ltc4287 device
>   ARM: dts: aspeed: minerva: Add spi-gpio
>
>  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
>  1 file changed, 373 insertions(+), 143 deletions(-)
>
> --
> 2.34.1
>
>
