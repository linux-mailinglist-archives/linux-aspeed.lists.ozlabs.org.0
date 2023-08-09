Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F607754CB
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 10:08:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nKr24M1t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLN3k6HrHz307s
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Aug 2023 18:08:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nKr24M1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLN3c6Dgxz30Jc
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Aug 2023 18:08:28 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so8950904a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691568504; x=1692173304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SrSTqgsbLJSsIks9TgxyFdkng+ofXzd27szmGw2vUQ8=;
        b=nKr24M1ttD9NhoF7aA2AQzPlfF8F/K88VInXAggqbbVCKFMUUxKdBXY8CCxM6YIru3
         zXeRqWiAfLLZE0JrNIkQx+ERXeXX4I8NN1rs53plu/YPJc+qScAWrGk2Y1SPmsQCa4Ps
         n5rmjRjJq2VC5zs39xSwuz5f8lAN+OxP+3qpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568504; x=1692173304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrSTqgsbLJSsIks9TgxyFdkng+ofXzd27szmGw2vUQ8=;
        b=OvN73j8OHzdYifMTG7E5hmSB7qcbht+Y0IM/YWqvm5bjfS1KrtgW1IZqwL6CyUIKch
         fbP8Pk00i0U65+9rnzcVfa0fPDXMpzr/Jf6HwiMzrsMAEqOnDIOjQdmr1lMlOmuAYF3Y
         b9EhxEp8b5EeLQUYmCHASN6NS13EcVYq8iiRdbxX68L3837ShOW4VE68hX3Mwljlgc60
         0SmPQ94OS8WYfz6gZ+NPS/9HsFxzr0L2fxds/lWewYariA8JMD8GRZwFVh9oVa3uDIuK
         U8V/8NEa6EQqia8yJpoHYP/Vpq9KzN7VKzGHg/x6DLhm37YyJ5+5tZjtxwDBDDnAHt4W
         Qw1g==
X-Gm-Message-State: AOJu0YwtyhOymeo8Lm9eGtepGJ+8DT2sX9KofY7gOui5oDSNo/tFsGi3
	VzK7zxLwTJGq4+MteLA79qVtDxttwmTLuTVx/cQ=
X-Google-Smtp-Source: AGHT+IHWLeW01BaNylBw+j4CoHMoP8qesgx2p10dtD7AQYa3aiYIzTPI/m7Xjh1jKl5QIUcxce01xjlniWpPyBahZl8=
X-Received: by 2002:a05:6402:184b:b0:523:4acb:7f41 with SMTP id
 v11-20020a056402184b00b005234acb7f41mr1726241edy.14.1691568504325; Wed, 09
 Aug 2023 01:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
In-Reply-To: <20230803230324.731268-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Aug 2023 08:08:12 +0000
Message-ID: <CACPK8XcFL7kM1yaA0+ZRSt27a0yreO+AH5cXtSk1TyjqyjH1WA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Fixup Wedge400 dts
To: rentao.bupt@gmail.com
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, taoren@meta.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 3 Aug 2023 at 23:03, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> The patch series fixes a few entries in wedge400 device tree.
>
> Patch #1 sets spi alias in ast2500-facebook-netbmc-common.dtsi (included
> by wedge400 dts) to make sure spi bus is consistent with flash labels in
> flash layout.
>
> Patch #2 enables more ADC channels in wedge400 dts.
>
> Patch #3 sets eMMC max frequency to 25MHz in wedge400 dts.
>
> Tao Ren (3):
>   ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi

I wondered if we should do this in the aspeed-g5.dtsi.

>   ARM: dts: aspeed: wedge400: Enable more ADC channels
>   ARM: dts: aspeed: wedge400: Set eMMC max frequency

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts    | 4 +++-
>  arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> --
> 2.40.1
>
