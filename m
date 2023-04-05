Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A086D7231
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Apr 2023 03:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Prnh81wswz3c8f
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Apr 2023 11:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HwSCCqXD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HwSCCqXD;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Prnh02l9gz30Jy
	for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Apr 2023 11:52:30 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id w9so137410855edc.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 04 Apr 2023 18:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1680659547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d4lO58vBzScCago2059HBRosOdt96vH3MDCMxFhDpLU=;
        b=HwSCCqXDMy0m5qpeuL3nho2ae7NGTVlp+favKncFsOEx+buTc7X76zde/6X9FZfRII
         dV/YFIHSGCBcdRTGl7XqPcAMmnbUas1kvc1hTPh67y9MHgcsTzgv8vup8iENJWoXfOzM
         NaKoLk9WvGGmezSnFQSkQKVME+kd61lNwBa7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680659547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4lO58vBzScCago2059HBRosOdt96vH3MDCMxFhDpLU=;
        b=xc3xVgK3Ujpa659akoTee18u50bAnwJXiUpoAcMC/a+tZWaPlRyIkS0J3iLVYEEqIA
         Wacs6SshtJ4S1X6tjQOeXJPlRx4XyLfdU90j7g24LcREULUQy8p+tpCLD3DA5PcYttdY
         7bxWfTC9vyPuuiXfcQMvIbgtq1cj0HVmlaCaKwU4nWsWDhUBLj9GtiVaZQkMt5hHXY+F
         swTCnkSkH1X6VB5LdSxHwEk7unWqhvJi1BLBtceO7OB1CwTUxG0VwkaLzccn/IvQuksq
         F4wYvUiHUjSccjzW3ER5xHPYwKfWoSbbYaX0WzzOtGJxVloZspiIqEIYD6bgj7If/sam
         DRJA==
X-Gm-Message-State: AAQBX9eujlG30aQhYxE/3gbIO/6n2+aG4gv5kjI33MquxZbiZTFY+2gS
	aa8EhelrvG2ogIFG7vw/qWMk9mW6PMos96LFoyM=
X-Google-Smtp-Source: AKy350Z4GY34/FyJIoHiTzDXPRoet2XYtZIsGqixctsIhgTdsjsUlDCm0ENZtjAH2qUyMbTU2uFhN6f3zFswoiR0zKo=
X-Received: by 2002:a17:906:e41:b0:933:1967:a984 with SMTP id
 q1-20020a1709060e4100b009331967a984mr726139eji.15.1680659547205; Tue, 04 Apr
 2023 18:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
In-Reply-To: <20230331091501.3800299-1-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 01:52:15 +0000
Message-ID: <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, Jack Chen <zenghuchen@google.com>, Matt Johnston <matt@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 31 Mar 2023 at 09:15, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> This series adds a new i3c controller driver, for the ASPEED AST2600 i3c
> SoC peripheral. This device is very similar to the dw i3c controller, so
> we implement this by adding a little platform abstraction to the dw
> driver, and then a platform implementation for ast2600.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I have also tested it in qemu.

>
> For those testing at home: there's a couple of prereqs for getting this
> running: we need the ast2600 i3c clocks in their proper configuration,
> as implemented in:
>
>   https://lore.kernel.org/all/20230302005834.13171-1-jk@codeconstruct.com.au/
>
> - this series has been merged to clk-next, but has not hit Linus'
> upstream yet. The series will still build fine without this.
>
> You'll also want the dts definitions for the i3c controller and
> pincontrol setup on the ast2600 platform. I have changes for those in my
> dev/i3c branch:
>
>   https://github.com/CodeConstruct/linux/commits/dev/i3c
>
> - and will send those once we have the driver accepted.

Given we have acks on the bindings, I think it's safe to send the
device tree changes now so we can merge what you have in the upcoming
merge window. If there's changes we can modify or revert.

Cheers,

Joel

>
> v3: expand the prereqs & background above, and implement some feedback
> from review. Mainly: rather that using a platform_data pointer, assume
> platforms will use an encapsulating struct for their platform-specific
> data
>
> v2: This is a rework from an earlier series that implemented this as
> part of the dw driver; I have adopted Ben Dooks' suggestion to split
> into a new driver + exported hooks from the dw base.
>
> As always: comments, queries etc. are most welcome.
>
> Cheers,
>
>
> Jeremy
>
> Jeremy Kerr (3):
>   i3c: dw: Add infrastructure for platform-specific implementations
>   dt-bindings: i3c: Add AST2600 i3c controller
>   i3c: ast2600: Add AST2600 platform-specific driver
>
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  72 ++++++++
>  MAINTAINERS                                   |   6 +
>  drivers/i3c/master/Kconfig                    |  14 ++
>  drivers/i3c/master/Makefile                   |   1 +
>  drivers/i3c/master/ast2600-i3c-master.c       | 168 ++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.c            |  76 ++++----
>  drivers/i3c/master/dw-i3c-master.h            |  54 ++++++
>  7 files changed, 358 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>  create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
>  create mode 100644 drivers/i3c/master/dw-i3c-master.h
>
> --
> 2.39.1
>
