Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2470152C793
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 01:33:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Tnr0Vfrz3c9H
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 09:33:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mJUxow8T;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mJUxow8T; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2ZRn6tKkz3bbp
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 21:59:47 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id kq17so34235278ejb.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=We6UnTkt5DfPq+wuwoB7alfZF2Hv9K3HgKR2Inooa2M=;
 b=mJUxow8TJYLd1QWdt4w54y14ncU32yxMoU6rAuy9WcO3jRkd7oe7jKuPrsY2rNm5sv
 1BKYohHd6rUaSdXm5PduVz5YYYj/WNzO1gyqgmznJEr4jwUuuz3xIIfspVy5iZUe5YhQ
 q1l32lRbVlLMCItWsIhV1mU6rnPvfK9fwRKkgflcgf0VpqLAtfHpwQNu1WE3VVurFdsA
 iBr7rfZ/WlcszsTo/UvoSvzdkTYmse0qFb60Qb/YjL/eEzexO99zZrjtWGhYLDrKF3fj
 La5T7bT9WybG4SiMlalfi1G9RI7UsOsibH+sFHt0JGH6m7rWrDkSKzp3bJrnWouYmXzX
 QPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=We6UnTkt5DfPq+wuwoB7alfZF2Hv9K3HgKR2Inooa2M=;
 b=v4JEUpZNUJLfkYE+0au8nvogEYmtVgFMhPs2wj1TTJbMukRPU1eQxClomkWsG7nxzC
 h546jAZKtplIbuI29OydWJq7nidDK1auxeRK5AaH3PCgdpD+5QXdNDCwFGdFSXeILCKo
 aJrYizUbz+I0ywmAQy7GNdxmwxv9t/HSJycXMaR6ERA2hY5lzmQD8WkQtH8WTnE97tfV
 NWAoL890Uewd+jAtP1Zyv1ZnhgYxl/nnWpoCzgPsmXTUGE+5safk6WaIAQTvA2RcrO0D
 c18kP1gL97sYfSh6j5IH9bvLW8ZKGxoEMhTJmKNMvb8b2+tjT391//mnxZTyMgRAR2i0
 df7g==
X-Gm-Message-State: AOAM5338NO1H1GmOnLCR+nSpq0riAJpxYtqPDKDZSgfgGsB5vqiurP4y
 7hz92vXXSwrpdqRvrLUlHQD0jw==
X-Google-Smtp-Source: ABdhPJyvwVUAbJ0QXLt9/CxdM+HPOyaIV1T5I4ZB9Qx0sEtfYLUok+mJqrxKP1RTakPh02MMo1ynRQ==
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id
 nb28-20020a1709071c9c00b006f429185672mr19312685ejc.439.1652788777021; 
 Tue, 17 May 2022 04:59:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 eg16-20020a056402289000b0042abb914d6asm2074448edb.69.2022.05.17.04.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 04:59:36 -0700 (PDT)
Message-ID: <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
Date: Tue, 17 May 2022 13:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517082558.3534161-3-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 19 May 2022 09:33:33 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 17/05/2022 10:25, Neal Liu wrote:
> Add USB2.0 device controller(udc) node to device tree
> for AST2600.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 3d5ce9da42c3..5517313eb2b5 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -298,6 +298,16 @@ vhub: usb-vhub@1e6a0000 {
>  			status = "disabled";
>  		};
>  
> +		udc: udc@1e6a2000 {

The same as DTS in bindings - generic node name, please.


Best regards,
Krzysztof
