Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB75E9E80F
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 14:36:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HpK36ShZzDqpq
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 22:36:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="j2dZVEnx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HpJr07pLzDqll
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 22:36:27 +1000 (AEST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3CFF22CBB
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566909384;
 bh=dAxS1WqRV4b7iS74EzUk2CY6pRW9CCrAG7RucQHWt7g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j2dZVEnx8ktgPjH/Vaf3xrdEzSnGNtSFvQb0SfS1RJp1Yw9C5pQQz94rLgPcHRpLf
 m7WTkmYD4w13R0zNQJGb0uqtomWErkOaQXu4YeTNlw29sJP3iq4BPmH4EU6v+ms0NV
 w1MKxTKsFpWKD6IwEwRK6gMlCs/hAjpvxJHiQfYY=
Received: by mail-qt1-f172.google.com with SMTP id i4so21033984qtj.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 05:36:24 -0700 (PDT)
X-Gm-Message-State: APjAAAWIxAH/bKIqzYrXogFRfxH336ISqBzQSZS+5uOUlHtrCr1/kRVj
 MAFpHfa2wbbxLdoQr21ILdaoHoi7i77MvoVezg==
X-Google-Smtp-Source: APXvYqyqEKW+TR5bJFFladOyjiCxYJlVjy2VJ+VJSQICBWMQEZulSFTqlCQVzHkPkq4vL9h4hPWYtKn93pLIWauILws=
X-Received: by 2002:aed:24f4:: with SMTP id u49mr22819140qtc.110.1566909383931; 
 Tue, 27 Aug 2019 05:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190826021620.11915-1-andrew@aj.id.au>
In-Reply-To: <20190826021620.11915-1-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Aug 2019 07:36:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJsLt5FjKayO9ksksrpXDFs3cbAngcQ21xhZYz3JLG=7g@mail.gmail.com>
Message-ID: <CAL_JsqJsLt5FjKayO9ksksrpXDFs3cbAngcQ21xhZYz3JLG=7g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: aspeed: Update example ranges property
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Aug 25, 2019 at 9:15 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The example node in the binding uses the AST2500 compatible string for
> the SD controller with a 64kiB ranges property, but the SD controller is
> allocated 128kiB of MMIO space according to the AST2500 datasheet. Fix
> the example to correctly reflect the hardware in the AST2500, however it
> should be noted that the MMIO region is reduced to 64kiB in the AST2600
> where a second SD controller block has been introduced into the address
> space.
>
> Also add the IBM copyright header that I left out of the initial patch.
>
> Suggested-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Hi Ulf, this is the follow-up fix as discussed here:
>
> http://patchwork.ozlabs.org/patch/1143090/
>
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
