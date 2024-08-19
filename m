Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D4956B26
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 14:48:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnXTV5ZxFz2y8f
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 22:48:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cwEC0i8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnXTR3Fznz2xDM
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 22:48:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C91E60C2B
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 12:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503FDC4AF0E
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724071720;
	bh=VeC6qinsgdSJFUHZy7TXTLOd71KCTHGWUrsHusbBpIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cwEC0i8IRulT7qVZqhY8X2U1LZyq5l5535fPl/Ay8Q3IgVvlq1M9qwPIM8YkrDSr5
	 oYXCRrhG/F/VgIQ9R5fgXXV3v39nZNrFQkqQJMDb8g2QIK/lb2eqOoKDPajlvGagee
	 +YcfoCjEOGX7y6/wJMxwUGGsaPNj0RlW04SCHxPt9IwrOVz0MbJHml0k9Lf+DPW0uz
	 5LOvQdUMS392dsjSj1+XOOJIuSq/DGZh7HvZ30Rl/8Cj5gKjbnw++6Mraw7cXRULhv
	 7uwY3hJyl5wyvpSwXLTp2ge5nrtFHDgE7jJOkLGcq5vOAhV5zKjO+Bj9H6YgyJAPiH
	 a1CKdxZjQJqlQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso877828e87.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 05:48:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaYskmmHDmnsOI+WnHmJFxjGzjVn8UmcHX7s8U5vt/+5BHy9bQBnI9raSFTqxVoBcaPLF+mNXTlcS3fomVA2CU2OMgbmrMteGgqiNlHQ==
X-Gm-Message-State: AOJu0YxEQVqpImQLv44dUY4fcgTyk0h6tIaw66yDPuH8/6yanw2X+15h
	52vensbEI5QKmoV7ovwjqrpfWFvnGusJdpnFkDwic4L/D5JxQLdgJfEd5nUALip3yZ/vto2/5er
	h7z6/QAYHiSXkQNO7YFC+AQzHSw==
X-Google-Smtp-Source: AGHT+IGUv2VCrgwia5FSI9wYqGvyyDKGFE3Ln0Q1xp1SarderZlIjiNvyFM5dBH1efWo1ZM3O5R0ZKaqxMqABBy+TZU=
X-Received: by 2002:a05:6512:2824:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-5331c6b1d1bmr7926481e87.30.1724071718624; Mon, 19 Aug 2024
 05:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com> <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240816092417.3651434-29-Delphine_CC_Chiu@wiwynn.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2024 06:48:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKtuuOyRu+fQ6Yu=7QHMWN+qPwwUYmuuEufYNtyyTw81Q@mail.gmail.com>
Message-ID: <CAL_JsqKtuuOyRu+fQ6Yu=7QHMWN+qPwwUYmuuEufYNtyyTw81Q@mail.gmail.com>
Subject: Re: [PATCH v12 28/28] ARM: dts: aspeed: yosemite4: fix GPIO linename typo
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

On Fri, Aug 16, 2024 at 3:26=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> Fix GPIO linename typo and add missing GPIO pin initial state.
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 554 ++++++++++++++----
>  1 file changed, 455 insertions(+), 99 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> index abd4a9173de4..4090725160f9 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -285,6 +285,8 @@ &mac2 {
>         pinctrl-0 =3D <&pinctrl_rmii3_default>;
>         use-ncsi;
>         mellanox,multi-host;
> +       ncsi-ctrl,start-redo-probe;
> +       ncsi-ctrl,no-channel-monitor;

Not a vendor prefix nor a documented property name.

Rob
