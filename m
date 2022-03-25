Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4884E72C5
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 13:11:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ1CM4sMjz3081
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 23:11:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.53; helo=mail-ej1-f53.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ1CF34Tfz2yLT
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 23:11:04 +1100 (AEDT)
Received: by mail-ej1-f53.google.com with SMTP id a8so14905469ejc.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 05:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3ZWXvCs/Q6kxcr/JmHxNuvohTupQgzCSrmsL9q3KkKg=;
 b=YzfK4AbbXI8QSLgUbnI1MvrABSTrDM6YBgDGOt2Xl/Uisz6ZZ8BGokeBAgW0993eja
 +UPo9JHaHJxtbjJZnrd0HH/RCPBcGiKiwhoH6JbXXOKYo9tgyu7BUzkv0haqwRbfOqI7
 O++7qat6yAD3rhE29d1zt2YXneF8q+h6yzhL4e42wKp1zztghfUMUGbzJ8AbprI6uyWs
 lkaVdGnLu3kyXxpy0LxdcAvWbHE7niCk9oovx431ffpoyLbLHa2dkLDKenW+Hg4hTTs8
 wkW9b5wNoDZ2z5r3IAWsSUCWxA5PBt7v9tvGDcWivI82TkuUoQ+qtNk22PI3m7Rn8jLJ
 ZQeg==
X-Gm-Message-State: AOAM531eEQdXEyy/ohu2JbRzqhXganiGAZj6Bd/97jUXjiwFsqRkAjMq
 cqZIfctyn/9TFNqtykcs3qU=
X-Google-Smtp-Source: ABdhPJz6udRZv1zxb/GwFg1uDoKALI3TINJjhCbOR0thlbYDWbZ1g9Qt5Elr5zk4wg6nB0QgOQADCg==
X-Received: by 2002:a17:907:1c82:b0:6e0:acef:d238 with SMTP id
 nb2-20020a1709071c8200b006e0acefd238mr1968938ejc.96.1648210259859; 
 Fri, 25 Mar 2022 05:10:59 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 cr19-20020a170906d55300b006df6b316e29sm2343511ejc.208.2022.03.25.05.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 05:10:59 -0700 (PDT)
Message-ID: <37768dc5-16ac-23ea-61a0-27f44e2fbd84@kernel.org>
Date: Fri, 25 Mar 2022 13:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Rob Herring
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20220325010316.451471-1-quic_jaehyoo@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325010316.451471-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 25/03/2022 02:03, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Add initial version of device tree for Nuvia DC-SCM BMC which is
> equipped with Aspeed AST2600 BMC SoC.
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v2:
> * Added a comment to explain 'rgmii' phy mode setting. (Andrew)
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts | 189 ++++++++++++++++++
>  2 files changed, 190 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c16f8a2b738..e63cd6ed0faa 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1546,6 +1546,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-lenovo-hr630.dtb \
>  	aspeed-bmc-lenovo-hr855xg2.dtb \
>  	aspeed-bmc-microsoft-olympus.dtb \
> +	aspeed-bmc-nuvia-dc-scm.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-mihawk.dtb \
>  	aspeed-bmc-opp-mowgli.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> new file mode 100644
> index 000000000000..1984d545b66e
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.

This does not look like DTS comment style (Only SPDX should be in //).

> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "Nuvia DC-SCM BMC";
> +	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS4,115200n8";

You should use stdout path instead.


Best regards,
Krzysztof
