Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8492688AF
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 11:42:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqhGq42vWzDqWq
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 19:42:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a43;
 helo=mail-vk1-xa43.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r1HydzdJ; dkim-atps=neutral
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqhGc68P2zDqVk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 19:42:14 +1000 (AEST)
Received: by mail-vk1-xa43.google.com with SMTP id e5so3965027vkm.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Sep 2020 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lofEGpAOdv9VKLTBFkELALaBiwoZZBeLnDfQKfPnGWc=;
 b=r1HydzdJaFGX/Wb2URqDIrAkORnKcuoIiBtihscyt9IXv5tn4J2YrwHp+Rlk5HLuLw
 jwDWgVgS4bG41AOBYzYEDqepuTN8P2g3vDbhv/NL+cUfsCfR7z+oE0R1lcYCwYsyhg3Z
 7HjF36WMlpdrkg+/WSAANh6aQj4e08wewbAL/U/u7ROXnoRTwoifkIDoO6J62RIkZkH8
 7e6A6VuRBGROTx51N6UOg/1WbMPZyXvUzGGXzIkdUhb8mYM8Jay2M4DcRZlc37fqm+28
 LuiPi8YeREfkidcriQ91HOPlxxroUQ86ubQ7N0M/iO5on0nGKJIvPIiHzQolD+GXr0vk
 AHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lofEGpAOdv9VKLTBFkELALaBiwoZZBeLnDfQKfPnGWc=;
 b=PdDPvim1d1kFL3moot+3SdFIToKa01vDq2k2Es33+lY2/BNgxcblRi/kodNjbkom4P
 F2ieRJuEJfUIVEJ8Sn2IQRKrJ6w+yGqB45G/AlZnxZalfOU2JFV0v3l8MStektnzV07x
 ZivTcdg8sii4RSaEGdcqmwxzhXh7c1w53foLPHKt++tIBaSgRxqfQKMj3QToyARbTxDb
 A1GQyIJ5Oqgd0I6lrxO0SReTMw+5xuL4J7yzspELeRgITlntKBlIPtp3/BmMMh0Kfvpf
 YPLvABTpXvOh0ARWMdWyBg9WHMFJVRR6p4abnpPHc+zkgu1ywRyIFKFsNgbYnLVFtu1Q
 lBiQ==
X-Gm-Message-State: AOAM531Q6Z0dvZt64b1YckpGgU1lhrf/ALGbon6kGQj8RJ8+lS/Fgooj
 wnLEKv1vznjkNgNjBJD1TXh7mYUOuYOoc0yJbNK+DA==
X-Google-Smtp-Source: ABdhPJy5sfsoQdr+vGacO0I5WzNvlvQDDeaFC3FaJejFIceTY+cEeosM+E+6TqgF2xJnpawCwl17UKP8W1fypUrPlhE=
X-Received: by 2002:a1f:1dcf:: with SMTP id d198mr694666vkd.30.1600076530291; 
 Mon, 14 Sep 2020 02:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200910105440.3087723-1-andrew@aj.id.au>
 <20200910105440.3087723-2-andrew@aj.id.au>
In-Reply-To: <20200910105440.3087723-2-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Sep 2020 11:41:34 +0200
Message-ID: <CAPDyKFq+QYzJNT94eFt2EsQBVqQciUoqnMDdrr3DbbkpnHRpCw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt: bindings: mmc: Add phase control properties for
 the Aspeed SDHCI
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 12:54, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Add properties to control the phase delay for input and output data
> sampling.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..75effd411554 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -61,6 +61,14 @@ patternProperties:
>        sdhci,auto-cmd12:
>          type: boolean
>          description: Specifies that controller should use auto CMD12
> +      "aspeed,input-phase":
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description:
> +          The input clock phase delay value.
> +      "aspeed,output-phase":
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description:
> +          The output clock phase delay value.

We already have a common mmc clk-phase* binding, see
mmc-controller.yaml. As matter of fact, there is one binding per speed
mode.

Could that work for this case as well?

Kind regards
Uffe
