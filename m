Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA5869A31
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 16:20:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PlMZ1wiR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkh592dXMz3d4F
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Feb 2024 02:20:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PlMZ1wiR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkh463lF7z3byl
	for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Feb 2024 02:19:48 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6092149eb55so12689047b3.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709047185; x=1709651985; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2SQHtHx9/7D+RJHlwNQ3ZmvXdbc7JG9vTHxtAChltzg=;
        b=PlMZ1wiRrpg+SsKdDEcXNaraluHS+5v2eUjQ3B3bxafxYggrlwCGnqQjHaiiH8nfsT
         5xjMkRhyPTKkSXnnyEt3OeCcdiTx7xmc5NkssQJcTMadw3O74wLMpGxHLlMuCAChNguI
         WL2I5Hi3ypie8MIXDrN4XRr9Nue7h1MmySwT3s5QC3wSqoJ423DNbrpCM7/CsNjOcJDM
         wa5Ctutszl+OJC1yrA7n6LamTKKs49ACecddXdiI0SLnz5htHFE1OhoboZqD14rdAJoG
         ocapJYlHwztU9eIWKA0s1U1YzjZEx6UtVKdu1E9mRg+ls4n1ZvnO3h9tJj3GKmHAatEU
         JFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047185; x=1709651985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SQHtHx9/7D+RJHlwNQ3ZmvXdbc7JG9vTHxtAChltzg=;
        b=HqLICEhU1jqbKUxd1/CQWzAH7iZEz9s98DS/XGbhjJAppPKEeOZqx9euYTr+cuwoKH
         Ga7FiKU4PGyBmizVIkgoGgMRBfKqWi0Tnh7pcjWBLavX8/Cjyy0qzOsyDlidsvE4J07F
         CiRAsX96yut5iaRoZA4yyYcBUfoQzBZWJLMUoztkvwKaCQJgX5gwpkhcPocriao+DQZq
         XRMbr2LbfdXGg881KilE/T5w12/qnuk5fe/C57e93rbXT8tHGXgm9Y5zwB6M/PiPpjcC
         0pWIbjDn2ugeEbI27PJrwEDKTs9ryK0fmPuN/H0mGqQ6OPi58noju1sQDjFv/0KV/mrH
         yWVA==
X-Forwarded-Encrypted: i=1; AJvYcCXCAWDHXImm8s/YeG/fx6VsHLRaXcfDcL/e3oWLtkZnEcDGGE6obDZAMIwJIZe12u5672szpkTiCiNT778FHfGlvphmFgcB0c88riKSXg==
X-Gm-Message-State: AOJu0Yzh8oWJpXhdYCGS5dVtgnXCBA1YYsif1t+ackOFwoDdutgUpdwX
	12VJfd7u6zva89f5+BExJf9sD8miAJZbnma6cgGYP4FCWiB8+Ota7Pl0VPLMehgG1Imv+0CKhK/
	Cg7wGZ5xyEgFA8rWFz5a7SCDI0PaOYDPMswAD6w==
X-Google-Smtp-Source: AGHT+IGb/gVl0DDdpeDrbG9O373vERg8t5XzgPbPswqg0c18k4mhJ043qddt56IRCGHrvdFkGSVOxmCdtVn3OngFE5w=
X-Received: by 2002:a81:5d84:0:b0:609:23fd:a3b5 with SMTP id
 r126-20020a815d84000000b0060923fda3b5mr2212466ywb.40.1709047184552; Tue, 27
 Feb 2024 07:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com>
In-Reply-To: <20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Feb 2024 16:19:08 +0100
Message-ID: <CAPDyKFoq=MXVdUP9hqMgOYN84aog1htYeWQzd9v0vWcU-TfVdQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] mmc: add hi3798mv200 specific extensions of DWMMC
To: forbidden405@outlook.com
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Paul Menzel <pmenzel@molgen.mpg.de>, linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, Igor Opaniuk <igor.opaniuk@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, tianshuliang <tianshuliang@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, David Yang <mmyangfl@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 at 13:45, Yang Xiwen via B4 Relay
<devnull+forbidden405.outlook.com@kernel.org> wrote:
>
> it's modified from hi3798cv200 driver, but quite a lot of code gets
> rewritten because of the hardware differences. Actually cv200 DWMMC core
> is called HIMCIV200 while mv200 DWMMC core is called HIMCIV300 in
> downstream.
>
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>

Please re-order the patches in the series so the changes to the DT
bindings come prior to the driver changes that use the new bindings.

Other than the above and the few comments I had on patch3, this looks
good to me.

Kind regards
Uffe


> ---
> Changes in v6:
> - apply the comments to the first patch, add their trailers
> - Link to v5: https://lore.kernel.org/r/20240220-b4-mmc-hi3798mv200-v5-0-f506c55f8e43@outlook.com
>
> Changes in v5:
> - pick the dependant patch: https://lore.kernel.org/all/20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com/
>   to fix the bot build error.
> - edit the semantic meaning of hisilicon,sap-dll-reg property (Rob Herring)
>   The suggestion is from the CRG driver side:
>   https://lore.kernel.org/all/20240218205741.GA1561527-robh@kernel.org/
> - Link to v4: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v4-0-0fdd9bd48532@outlook.com
>
> Changes in v4:
> - rename dw_mmc-hi3798 back to hi3798cv200 - Suggested by Krzysztof Kozlowski.
> - add r-bs to patch 1 and 2 - Reviewed by Krzysztof Kozlowski.
> - Link to v3: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v3-0-f15464176947@outlook.com
>
> Changes in v3:
> - dw_mmc-hi3798: fix bot error (Rob Herring)
> - Link to v2: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v2-0-010d63e6a1d5@outlook.com
>
> Changes in v2:
> - dw_mmc-hi3798mv200: use dev_err_probe() helper - Suggested by Krzysztof Kozlowski.
> - dw_mmc-hi3798mv200: add missing err=0;
> - dw_mmc-hi3798c(m)v200: remove unused MODULE_ALIAS() - Suggested by Krzysztof Kozlowski.
> - binding: rename the binding, a lot of tweaks suggested by Krzysztof Kozlowski.
> - Link to v1: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v1-0-7d46db845ae6@outlook.com
>
> ---
> Yang Xiwen (5):
>       mmc: host: mmc_of_parse_clk_phase(): Pass struct device * instead of mmc_host *
>       mmc: dw_mmc-hi3798cv200: remove MODULE_ALIAS()
>       mmc: dw_mmc: add support for hi3798mv200
>       dt-bindings: mmc: dw-mshc-hi3798cv200: convert to YAML
>       dt-bindings: mmc: hisilicon,hi3798cv200-dw-mshc: add Hi3798MV200 binding
>
>  .../bindings/mmc/hi3798cv200-dw-mshc.txt           |  40 ----
>  .../mmc/hisilicon,hi3798cv200-dw-mshc.yaml         |  97 +++++++++
>  drivers/mmc/core/host.c                            |   4 +-
>  drivers/mmc/host/Kconfig                           |   9 +
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/dw_mmc-hi3798cv200.c              |   1 -
>  drivers/mmc/host/dw_mmc-hi3798mv200.c              | 239 +++++++++++++++++++++
>  drivers/mmc/host/sdhci-of-aspeed.c                 |   2 +-
>  include/linux/mmc/host.h                           |   2 +-
>  9 files changed, 349 insertions(+), 46 deletions(-)
> ---
> base-commit: 8d3dea210042f54b952b481838c1e7dfc4ec751d
> change-id: 20240121-b4-mmc-hi3798mv200-a5730edf122c
>
> Best regards,
> --
> Yang Xiwen <forbidden405@outlook.com>
>
