Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAEF6A6474
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 01:51:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRG091HfXz3bhZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 11:51:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VcSOZCZF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VcSOZCZF;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRG020J4Qz30Mn
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 11:51:45 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id h16so47455937edz.10
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 16:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfiiCeT6CH9N3GnRNK7XSOpj4MNvbXSqN74H0hX4Zqw=;
        b=VcSOZCZF9v+xln7mYQsVhNnq3aFNMCZQt7EyYMsQ6NkzivikabFgQ5nFjZTBam19J1
         UcJeSoHkY8LFxkbaYoUFT1PeAwgrTsF+vbwhgq1n/GpoYqdR4jC3JfVig6IS5qvWyuL4
         vj2e7623vy3kM0y797YHKDYXNDvrc8u2BRSzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfiiCeT6CH9N3GnRNK7XSOpj4MNvbXSqN74H0hX4Zqw=;
        b=nCH9M7KO5iiQqVdbZIP9BTnjAIAlWd6ZMzUNEEnxukgyTmilpkpxHHUe5Chk3+3kGR
         GuEJhdZRDsUtsqyqRO+x1fyB6Gdg23EQlO1JpIY5+BAssZLFEldwDy9IE/NYZyv85F6x
         gRWJqxY2e4Lcvai7tKfoJlJdSZWjcUWMtkiByE0RXcVcTf13EkTOVDwna1i97/rVGEdB
         25P/dc5tAFbTrVdXydZPDMwZAEVWg0iPA6yLutDJ7QAuGTZlNBOqTCfrFWan90p7Zm9B
         n++eZfeoBrUEJDxWyG5SIEpMhkMWPI4vuTq6qrGqCi9CkmqMm9Rm6raEw8OXDhkXHyEN
         XXfw==
X-Gm-Message-State: AO0yUKVOq9xivwwuah9bjlPGgudGItIYd4zRN68ZRuz+B9NMqcQVWiha
	sPcyTZ3VdhRKe97TZjBprvLNv83jQpKLByRa2RI=
X-Google-Smtp-Source: AK7set9s5FuktP6ww51vIQDgV4nv05F5vO++W6aPiA8dIhzXb4YekhREHSxdBQV37coSS68KC1v14qpix80wFiu11Bs=
X-Received: by 2002:a17:906:a84f:b0:8bf:e82a:2988 with SMTP id
 dx15-20020a170906a84f00b008bfe82a2988mr2346734ejb.4.1677631901768; Tue, 28
 Feb 2023 16:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-3-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-3-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 00:51:29 +0000
Message-ID: <CACPK8XebiPGe3o7uQgvpOyQ5tzn+o-AyugbJOqUh+4QzG8QgrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: ast2600: Add top-level I3C clock
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 28 Feb 2023 at 09:16, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
>
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
> v4:
>  - use contiguous clock index
> v3:
>  - split into separate bindings & clk changes
> v2:
>  - reword commit message
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index d8b0db2f7a7d..dd1581bfdf58 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -87,6 +87,7 @@
>  #define ASPEED_CLK_MAC2RCLK            68
>  #define ASPEED_CLK_MAC3RCLK            69
>  #define ASPEED_CLK_MAC4RCLK            70
> +#define ASPEED_CLK_I3C                 71
>
>  /* Only list resets here that are not part of a gate */
>  #define ASPEED_RESET_ADC               55
> --
> 2.39.1
>
