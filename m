Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0DA7367
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:15:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGqN5pN0zDqDx
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:14:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e42; helo=mail-vs1-xe42.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="bhjl/ew8"; 
 dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hqy63RnNzDqYB
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 23:50:19 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id y62so13484699vsb.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nPR2CQfWmgZTkvcpGyqAZkf0myEhVejsZD6gsIT8RYg=;
 b=bhjl/ew8Pdmkn2py/fJ8FKDq4d1wSwcKFwpAqCni+esZ62NP1wDMuTrPNmksJfOg+Y
 My7X+wD93QUDR0E3hIw3E1A8iE7iMuv3TRRMCS3eIOphYFDZF6fKOzuCq2zdoUxjVHh6
 3+WsdoF0ZGK3YXkZHXokWSPcVEecQW0K0NSoyk88GKCLv84yCim1xpARfVciR67DTXNJ
 KbB7KkvbrM16nS6EQSKVHuZdTISASCfdZ4mJetpH93xPtPxg9o2VfQdTvVIiIslYhgQa
 G0PTMTp7ZX6VsTVAGrRDF/zQd9Z+fdlvN31tSNuTNgvkcvZSwUdXdRF7/PPw9J8ppeB9
 VJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPR2CQfWmgZTkvcpGyqAZkf0myEhVejsZD6gsIT8RYg=;
 b=iInWQj45HsWg2dZdWgcvXEsb2b5iNf/oXkADr5YE3NMVugpnhAzW6YlkSodm1aS9r9
 XC1I+rfYD0UAJgF+ffCUXZ7cpzOjra0i4D8RdQ9dfqvVeRi1NHzDPofOiCHkwmFhQjEA
 79y2AgfydswtsU3ULPbNsqLlY80N3jL3Ec6hgXqBSAFfZcuPf9PxaXPDH8+BWclvuizr
 XdQIB+8UHFzs9sLFBEZig1dfcCOClX7HLCEWk0SKtVtHKQdK8kUt2JGhfTGrNiX3ROcC
 wn3PehDSlVtHSV4ONsPzqcUzs4zJ8nljjimBGVZodeeRyWcaZp7Vq2bNwTa887bwvUYM
 SMEg==
X-Gm-Message-State: APjAAAUmdpyftOs6SqTiOIms3JJa5e3nUk2M1H4xeG2wMrTaQv357N+x
 JqiaYI60lN8KhyLqlocZFy+NGkg+uEoNjdxxYYQ7kA==
X-Google-Smtp-Source: APXvYqzQ8I7Ep8k3tduFMMa8uUTlPd+Xy5TxZlq8ti8zHd5KPR80iTc/2sx/Oh/nNRZf59jUJo5lhvjPC3uSaxWvRL4=
X-Received: by 2002:a67:fe4e:: with SMTP id m14mr14252340vsr.34.1566913815413; 
 Tue, 27 Aug 2019 06:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190826021620.11915-1-andrew@aj.id.au>
In-Reply-To: <20190826021620.11915-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Aug 2019 15:49:39 +0200
Message-ID: <CAPDyKFroS-Z+4QYitmYrCugPV_f4u1MDJiRkDxGWvVjsU=9RgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: aspeed: Update example ranges property
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:11 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 26 Aug 2019 at 04:15, Andrew Jeffery <andrew@aj.id.au> wrote:
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

Applied for next, thanks!

FYI, I took the liberty to amend all aspeed patches, by putting
"sdhci-of-aspeed" as the prefix of the commit message header.

Kind regards
Uffe


> ---
> Hi Ulf, this is the follow-up fix as discussed here:
>
> http://patchwork.ozlabs.org/patch/1143090/
>
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 570f8c72662b..200de9396036 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright 2019 IBM Corp.
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> @@ -84,7 +85,7 @@ examples:
>              reg = <0x1e740000 0x100>;
>              #address-cells = <1>;
>              #size-cells = <1>;
> -            ranges = <0 0x1e740000 0x10000>;
> +            ranges = <0 0x1e740000 0x20000>;
>              clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
>
>              sdhci0: sdhci@100 {
> --
> 2.20.1
>
