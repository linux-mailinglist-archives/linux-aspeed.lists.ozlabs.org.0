Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200F6A7A0A
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 04:28:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRxQB6Kznz3cKn
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Mar 2023 14:28:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c3FUBFlI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c3FUBFlI;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRxQ31tfsz3cJY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Mar 2023 14:28:11 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id u9so12838486edd.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Mar 2023 19:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LwhRS8qLgHTKH8umgxJ2vm9VG3sN3u1iw/JreXfnhyU=;
        b=c3FUBFlIBHw60SVBvbHj7XbSLr+jVIOBLS/1Bn1CIxgwx7idkAzuDlReE7GgtQPLmX
         /SYNC6e+oBZfSYvg0POjv0mRTW/nD1x4FnuRs9m8xPo8hpkH7suqOSoDA3rB/YyGqZG5
         LsZOKG/nrkj8WQidhwk4C3VL5K6nRGQWfRMjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwhRS8qLgHTKH8umgxJ2vm9VG3sN3u1iw/JreXfnhyU=;
        b=We4MCHEhetQIeQ9AmIiJLJYC7xaI4PFMtPeTdqEPcvp3LF2L2Y5T0KGptccPiGTJ5o
         xSSKbyv36AgABMBzDT0ssW8tc2T+ph+paRsdxirfKYkgDT4Zck9TAYc1iIMihihGGzBV
         hnR8Sj70t6zmwWVxhsbjm1dgkpt8KyOmgGZtXbWsFVa8nM5efm4M/klRA+O9nZuxxgrJ
         zMcS2SzjIr8TKOC7lqcQAA357PfpaIOINK6V3tt3dTr0VGKSXFdBFS1Y2NRanmMvaQd3
         D9JzEszBFhXUuX7n1WmCR+3BM7Uw+7X50mjQIiXEsev602CfMXz2R+O8qQdHfYqBPi2l
         lv1w==
X-Gm-Message-State: AO0yUKVs6qJ9Tg4HuukmQkEEHIqhZyq4+hZSUYkSWc0HKeLn/G6i3crz
	6npG+c5ST0OwkP+58FS8kE56br4//8m+Lr7iSZo=
X-Google-Smtp-Source: AK7set9/B/vXKjq8akQcPEEGlVG90GcECtmmW7Git9heHEsK5qxYH2yUDSkj3xFYfLgio2WKGG7hBz19vXdJ6r4+eik=
X-Received: by 2002:a50:d743:0:b0:4af:515d:5691 with SMTP id
 i3-20020a50d743000000b004af515d5691mr5115879edj.7.1677727686782; Wed, 01 Mar
 2023 19:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-7-jk@codeconstruct.com.au>
In-Reply-To: <20230302005834.13171-7-jk@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2023 03:27:44 +0000
Message-ID: <CACPK8Xcd5XyLc3aO2nUXWFMAZnEdooBE=z_qj6H6d+vfOrnSug@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on
 reset definitions
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

On Thu, 2 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The current "not part of a gate" is a little ambiguous. Expand this a
> little to clarify the reference to the paired clock + reset control.

This confuses me, but if you think it helps then that's good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index b4d69103d722..e149eee61588 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -87,7 +87,7 @@
>  #define ASPEED_CLK_MAC4RCLK            70
>  #define ASPEED_CLK_I3C                 71
>
> -/* Only list resets here that are not part of a gate */
> +/* Only list resets here that are not part of a clock gate + reset pair */
>  #define ASPEED_RESET_ADC               55
>  #define ASPEED_RESET_JTAG_MASTER2      54
>  #define ASPEED_RESET_I3C_DMA           39
> --
> 2.39.1
>
