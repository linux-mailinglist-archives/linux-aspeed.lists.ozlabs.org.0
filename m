Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E377847A
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Aug 2023 02:14:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=I7YRRJs8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMPRh6hLzz3c3x
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Aug 2023 10:14:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=I7YRRJs8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMPRZ211Mz30fF
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Aug 2023 10:14:16 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99cce6f7de2so206486666b.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 17:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691712852; x=1692317652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XlFDrgd4Kjgs88FYYyhC1up8TqnDvp4WBELyUE1OyrA=;
        b=I7YRRJs8HkI8fcSoO3+uj1zSU6OiINQeNAr6ehSd1x7yUHjTJQ7awZP96zwUzgi8B8
         O96FCkcDHhVenS5Cs9Li/Ps8brLRKAEzz4QcnjpDgdDdHymlGd13AhYVN57sHeMNMEVp
         BLLQDnjf6DI/jxCDEFMfYKOnkAx3gkAlV+40g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691712852; x=1692317652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlFDrgd4Kjgs88FYYyhC1up8TqnDvp4WBELyUE1OyrA=;
        b=JYHutPhxBwzA1VR61ca+MqkeWhTo+I9qwVbMJAp9S2pTCIndCQ2REtdXxMrLIlNLZJ
         IqI8spV+u1gv6cuL3W0Q8gaNE8rFiqGOUEn48Liu73f3eFgjL6Ib3LdfTashPd4JCobw
         bOKv4hk0y7BTvBTEFQM7G4blKkEUQ7mFXZM+k/2lwWZji0JtoAIZj5gY2weq/lD2zdXP
         xH3Gckb4u8gOQRMOuOr6+pW2/7U/8IeCltmEGEoT09/rZ5+WtbbL7LalDejE1cMpaQny
         WfBN98q4rqwPhKhubXU6IEVPUCWZCWzOrkoMISa15b0+ADHcGKnge5f7BYZ39zP3Nph0
         BcmQ==
X-Gm-Message-State: AOJu0YxNq3FkJi04XUohNJi7pSJaP3qCUxEEUMOri+t2Th0oXUUqT/e2
	rciSRAkTC9dbIbW//ofgYASjA97VIgc3K7cmFnE=
X-Google-Smtp-Source: AGHT+IGn9S/blGrvEnNPG7qZMlGuQ9p5jKZ+zLGBRss3rKyDzeHjb4zDHGyCXJezpLMHz3B3HavVDYhG2jahJHGLr54=
X-Received: by 2002:a17:906:3087:b0:99b:e6ec:752c with SMTP id
 7-20020a170906308700b0099be6ec752cmr312934ejv.70.1691712852333; Thu, 10 Aug
 2023 17:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230809134413.3614535-1-dylan_hung@aspeedtech.com>
In-Reply-To: <20230809134413.3614535-1-dylan_hung@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Aug 2023 00:14:00 +0000
Message-ID: <CACPK8XcwcufQRYj+QX9KLyGDEXMFQeK816iDknZnT58sTDk+Mw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: pinctrl-aspeed-g6: Add I3C1 and I3C2 control pins
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, kobedylan@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Jeremy Kerr <jk@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 9 Aug 2023 at 13:44, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> Add pinctrl support for the I3C1 and I3C2 pins.
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
> changes in v2:
> There are no code or message changes in v2. This commit is being made as
> a standalone patch separate from the original patch series, as the other
> patches from the original series are no longer necessary.

Thanks, I've applied this.

>
>  arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
> index 7cd4f075e325..289668f051eb 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
> @@ -297,6 +297,16 @@ pinctrl_i2c9_default: i2c9_default {
>                 groups = "I2C9";
>         };
>
> +       pinctrl_i3c1_default: i3c1_default {
> +               function = "I3C1";
> +               groups = "I3C1";
> +       };
> +
> +       pinctrl_i3c2_default: i3c2_default {
> +               function = "I3C2";
> +               groups = "I3C2";
> +       };
> +
>         pinctrl_i3c3_default: i3c3_default {
>                 function = "I3C3";
>                 groups = "I3C3";
> --
> 2.25.1
>
