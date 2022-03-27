Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2BF4E896F
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Mar 2022 20:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRQ4g0KJfz3c1j
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 05:55:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.45; helo=mail-ej1-f45.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRQ4Y0N2lz2yg5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 05:55:07 +1100 (AEDT)
Received: by mail-ej1-f45.google.com with SMTP id dr20so24518694ejc.6
 for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Mar 2022 11:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YwbLSkhAhv71b7BqMWwMTjCUozmugKwUkYZsOSrVljw=;
 b=hFzxFnR7Dhre5ScGODIvBlzKZde4S63HQ8fwJKSaOwU4g0BSjKqfGe/dXWWc7k3oqH
 H19DlgHQ5xHJHMhCRbDkjjjS6BKyNuoZavYVb6MKjnezN5ZnzDp5C0QU/dUeCeUKD6am
 +PmD3bnQCOeaxnuQS+5tKHxnOKC3CqFsHrzpoLkDBtMcPpW1euA3bohjkajYJBUtSE+2
 3N4Qvf/DJyJzPcE+t6HWGv3UgGXqtJiBJpYI5/EhJH2UDpFlpajrANYEgVI7LRlL6w29
 MWnFXf1BNUjz/LU/CwhsCUg4jHzUiv5A1NLumr/b8Ps+cU/iXPcido89cl0Uk68VDTC1
 Nu4w==
X-Gm-Message-State: AOAM533Tz7X6GSZr06DeHQtSzMzScfHtGRjoCntSMuPWsBRxjzHWLS6L
 9a5MshYxW5RUxnZKpy8Y3CI=
X-Google-Smtp-Source: ABdhPJw6QwVCren7Lfi876IHWRqngigrVpnqRQinWfkHvPVEfEPpKV1HrCuuFajuAHep7X3NzFX58Q==
X-Received: by 2002:a17:907:6e93:b0:6df:8c1a:d08b with SMTP id
 sh19-20020a1709076e9300b006df8c1ad08bmr23020679ejc.557.1648407302601; 
 Sun, 27 Mar 2022 11:55:02 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 i25-20020a056402055900b004191a652e3bsm6093309edx.30.2022.03.27.11.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 11:55:02 -0700 (PDT)
Message-ID: <d0044322-72d8-1348-9898-dc91e3192e94@kernel.org>
Date: Sun, 27 Mar 2022 20:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] ARM: dts: aspeed: add Nuvia DC-SCM BMC
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Rob Herring
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>
References: <20220325190247.468079-1-quic_jaehyoo@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325190247.468079-1-quic_jaehyoo@quicinc.com>
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

On 25/03/2022 20:02, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Add initial version of device tree for Nuvia DC-SCM BMC which is
> equipped with Aspeed AST2600 BMC SoC.
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v3:
> * Added 'stdout-path'. (Krzysztof)
> 
> Changes in v2:
> * Added a comment to explain 'rgmii' phy mode setting. (Andrew)
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts | 190 ++++++++++++++++++
>  2 files changed, 191 insertions(+)
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
> index 000000000000..f4a97cfb0f23
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
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
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8";

After adding stdout-path, please remove bootargs.

Best regards,
Krzysztof
