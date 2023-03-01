Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E46A6489
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 02:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRGGx268lz301F
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 12:04:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LD/KmWHq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LD/KmWHq;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRGGn2KXXz2yHT
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 12:04:31 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id ec43so47544986edb.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 17:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d4OrUOl51NPQf5S1PMv0oO+zYb0X1S9MmPzIm8SUt+E=;
        b=LD/KmWHqfartLmkLJt7gHl5eGHb7wHaDCmWPOru/WQV/XzmSkvRwmwUpo/cdsuM/e4
         LuKGXKskm9LBLx6ShF8U3PXcAFDYfQlbfpEMeHd8fJRhz38h0/WAyi/270I9IAsY38je
         UD55B20H2G9dVQ2qBSR8dqeQsEEHYK0K8WfBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4OrUOl51NPQf5S1PMv0oO+zYb0X1S9MmPzIm8SUt+E=;
        b=yvaL+ZMCO8XSbbzTqsSU5yVJQQYMBpMI7xu08r/qK3qyXXCz4bQCImt512VObb2HJ6
         P+RxDGN4FdDrQ5EUUWFHHOv3JL8XHBJ7/WhczzIhLDtELvq2rrHOWttOMCSkA6Gw1Bwr
         bLmvk42MAMR2AGGYDrpXLnEyp4hh8ckJLYOpybRQNXqFfmCiRkVVlkjCG9ID3BKysZtw
         8UR7apeVQma9Af8y8h1QiTGeOnQqCausDbrhNZ1KQzPObj7KzsYNptNrYYUkfDowTQqg
         sLVmX76IkrHDlC/9LBUdvSkWgof5VpGjLsAKdCH3ErraBNxSdvGwEjK1Bo+oFSVSN2SF
         yOCw==
X-Gm-Message-State: AO0yUKW5X1T4QuI9MQ8SHCYb5e5MOukHKXOv4GUXWMoeZvlz5RQEMHrz
	f9xLPQ8Zo2EU1ErkkVebloj28ic6PWXGwhG8KNp4ZxTj
X-Google-Smtp-Source: AK7set+fLFqpaxP5q+miLeUyFfMGmV4RfJfEWRXJHRxOJeZuwqCAnyyTGPu4fdOX8uAmhcaCsX/0mtIygdv83fTuqrQ=
X-Received: by 2002:a50:9f6a:0:b0:4ad:7439:cecb with SMTP id
 b97-20020a509f6a000000b004ad7439cecbmr2688575edf.7.1677632667191; Tue, 28 Feb
 2023 17:04:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676532146.git.jk@codeconstruct.com.au>
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 01:04:15 +0000
Message-ID: <CACPK8Xd0k8EKR1v4NVmgb6yp3Zh5hUyVyoxsyk0NTx9MF80oYQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] i3c: Add support for ast2600 i3c controller
To: Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 16 Feb 2023 at 07:42, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The AST2600 SoC hardware includes a set of i3c controllers, based on the
> designware i3c core, plus some global registers for SoC integration.
>
> This series adds support for these i3c controllers, through the existing
> dw i3c master controller driver, by adding a set of platform-specific
> hooks to handle the global register configuration. This also gives us a
> way to add any future hardware-specific behaviours.
>
> We also need a DT binding to describe the ast2600-specific hardware.
> Since this involves new (mandatory) properties, I have added this as a
> separate binding rather than add a new compat string to the dw binding.
>
> The dt-binding example depends on a prior submission to the dt binding
> headers:
>
>   https://lore.kernel.org/linux-devicetree/cover.1676294433.git.jk@codeconstruct.com.au/
>
> Full support for the global regmap will land with this queued mfd change:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=cf2271843de835839e91c5c036492a87085af756
>
> Of course, any queries/comments/etc are most welcome.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cheers,
>
>
> Jeremy
>
> Jeremy Kerr (4):
>   dt-bindings: i3c: Add AST2600 i3c controller
>   i3c: dw: Add platform operations
>   i3c: dw: Add AST2600 platform ops
>   i3c: dw: Add compatible string for ASPEED AST2600 BMC platform
>
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  73 ++++++++
>  drivers/i3c/master/dw-i3c-master.c            | 165 +++++++++++++++++-
>  2 files changed, 232 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>
> --
> 2.39.1
>
