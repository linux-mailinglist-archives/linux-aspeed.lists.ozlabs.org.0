Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89A60C20C
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 05:06:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxGzj15D0z2xbK
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 14:06:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NPSEdvmA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NPSEdvmA;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxGzV5xH2z2xbK
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 14:05:56 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id bp11so18230775wrb.9
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 20:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XHZj3l3++Ddr3AOE8EL7nYLAyx2hz56W7EAVPvSQms4=;
        b=NPSEdvmAHyQF7GYSkWJQEQkWJSJpiFYRTsRfpCyuezJNlbV6knOWbB6PP/Cuu1uQG4
         5CAung3kEF3WKB9l/h7Sw08bSjk0rgtCMdbMLtUIhzdvDSobxbRBd11J0amsDi+ttgeQ
         fKjjU2XHz6OmLtkwhMkPTveeI3pK7DGq22kro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHZj3l3++Ddr3AOE8EL7nYLAyx2hz56W7EAVPvSQms4=;
        b=32PSNIdEAgeaCjckWwK/saY5q6ODpuETTWo3BksCRIb8VrSkNCQ8SsfuGvriPHBQ16
         iU4eqksR1fEZlB7pN7xRcOQRNp+eSFa0n9fPJLp4ajU2YM90Y/6tLf7CuUocWYSzQXlV
         +eoSujL87KXOOctesJua+47eM2YHVOp1oCm2bIn4rwWwOiJffz07ovX7MaigZsXbCNb+
         uae6+76vRxPPO5SNNp61EfDlWGEZiknKHPEfrVKoC+Tx2B9L0E/FqFIiiHUiwu5dRuVg
         GNosVU9g7KSy/2eQyMLxnRIVChc8hXFGBNzRNhCPYv2cya3ge2p4p3a5ZOD7kUXLTV1j
         0crA==
X-Gm-Message-State: ACrzQf1rqk2tDByFSRcQG6KaEOSnCxpyIl0eCcGd87CQmeoyg4xD9aHJ
	2p4Wqhl1nURcda1EFSXsOs02lh0Xe3yzrQX0kw0=
X-Google-Smtp-Source: AMsMyM4PUgPNLOA6UQuNP0O23XeSyalN1qOy6S5PHSg5rvuSZ55XK4sYYo6iVHQAylF9tZnjSQED/H3/2Wbjqbo6rZo=
X-Received: by 2002:adf:df83:0:b0:236:6d5d:ff8b with SMTP id
 z3-20020adfdf83000000b002366d5dff8bmr6843563wrl.315.1666667149764; Mon, 24
 Oct 2022 20:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221025024145.1561047-1-potin.lai.pt@gmail.com>
In-Reply-To: <20221025024145.1561047-1-potin.lai.pt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Oct 2022 03:05:37 +0000
Message-ID: <CACPK8XdpeKVaxFki3GRyo30bWYNF6Q5wL706j5deaqi8P=ssdA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: bletchley: add aliases for mdio0
 and mdio3
To: Potin Lai <potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 25 Oct 2022 at 02:43, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> Add aliases for mdio0 and mdio3 so that we can use name to lookup the
> address of Aspeed SOC.
>
> For example:
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio0
> /ahb/mdio@1e650000
> root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio3
> /ahb/mdio@1e650018
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index c02c15f15465..2825d5f3f78b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -15,6 +15,8 @@ / {
>
>         aliases {
>                 serial4 = &uart5;
> +               mdio0 = &mdio0;
> +               mdio3 = &mdio3;

Should this go into the dtsi instead?

>         };
>
>         chosen {
> --
> 2.31.1
>
