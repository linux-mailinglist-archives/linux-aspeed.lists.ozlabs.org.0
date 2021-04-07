Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C93577C5
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 00:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFzhj70M8z30B5
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Apr 2021 08:34:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QqEQVjUA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QqEQVjUA; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFzhf6J8Zz2yxm
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Apr 2021 08:34:09 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id 6so98616ilt.9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Apr 2021 15:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l5x8E8IpB6sBOTSYy7T7VMMyQFpGPv4ck3hMiF4swhc=;
 b=QqEQVjUA/Fiwi89/NL2AyGwFBPVPPOLUkceVpGjJ0Ln3tFYM+3GiuxBFgLLvBk1W8U
 niGhuXKl08MiHlRAD7tVRDD4zFwFQd+R7wy50p7JUTJ929C5wgFa4ORPjSwccS2EGKAr
 3twyQpu9pRTcsvBSnZx0ZSpnwwJZZ94THz+2DpTayXtLaImpFEgyog+CPpnqgmQIm2av
 gOg7wqNaUg3xaFy6ZHd5WPRbJfneX8F5Amr3x9Uo+nlIJ8XBdpw9t/FQ6WTulCH4IS/r
 2DekhNK1qzVtUHkoVJ+9TISFYHW6lBaDcHnYP0lTdDo8HyyR1WEJVFeR1Ua1VmzmW5PC
 6nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l5x8E8IpB6sBOTSYy7T7VMMyQFpGPv4ck3hMiF4swhc=;
 b=ZDhN+Xa7imQWtPkSMPXbNSqntScykouixqHgtPyf+3xkoxlfWUwEdezU/I4VXIEgqb
 jl986xsTSccU6r6C5ZcujQjj4uGVPYnrzOvNizckAqSuo5hzN532f7Ax9rOKxqwd4tvs
 LqpPaUU6qduQfqjZV8EEdHIEHWiMzqdnncbeYYfYbVV1cOofJEO4kzaX9TOcmmw+ZoCK
 QjmFLV5KcphVb7QfDEdZwWgRJJgE3d0ODD3WAbxjqraZYUu8yWcQdkptPG9HMsh1Y4pD
 LgRtU7UjqDaccfkwbcWy6fJZgCAZvPpdcpU6KDFl3oJcmhf9Os3svqC1NXpCQUw2B+WV
 d++w==
X-Gm-Message-State: AOAM530U/9zLauTdgnSifYyyPxCrtydyxz6cVu/UhFQMrt79m754bSqB
 ynbTUQWTUPlXixe1cd7ZLrbsj6v9/Vb4AA==
X-Google-Smtp-Source: ABdhPJzPKZEiVctM8VC3mirjU8CPONK+xKH95eGyh2ea+GSaZsjmVzycO3rChD2Gz0V0s/X7TY02Gg==
X-Received: by 2002:a92:c844:: with SMTP id b4mr4457253ilq.36.1617834846367;
 Wed, 07 Apr 2021 15:34:06 -0700 (PDT)
Received: from [192.168.4.31] (199-48-94-65.rochmnaa.metronetinc.net.
 [199.48.94.65])
 by smtp.gmail.com with ESMTPSA id e7sm2002295ilm.60.2021.04.07.15.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 15:34:05 -0700 (PDT)
Subject: Re: [PATCH 15/22] ARM: dts: Aspeed: Everest: Add pca9552 fan presence
To: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
References: <20210329150020.13632-1-eajames@linux.ibm.com>
 <20210329150020.13632-16-eajames@linux.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <a6ca4ac6-6f6d-b6d5-f3c9-ed304aac3eb0@gmail.com>
Date: Wed, 7 Apr 2021 17:34:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210329150020.13632-16-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 Matthew Barth <msbarth@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 2021-03-29 10:00, Eddie James wrote:
> From: Matthew Barth <msbarth@us.ibm.com>
>
> Add the pca9552 at address 0x61 on i2c14 behind mux0 channel 3 with the
> 4 GPIO fan presence inputs.
>
> Signed-off-by: Matthew Barth <msbarth@us.ibm.com>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Brandon Wyman <bjwyman@gmail.com>


> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 128 +++++++++++++++++++
>   1 file changed, 128 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index de2606b416e6..d7f23b74dd4b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -171,6 +171,37 @@ vga_memory: region@bf000000 {
>   			reg = <0xbf000000 0x01000000>; /* 16M */
>   		};
>   	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <1000>;
> +
> +		fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
> +			linux,code = <15>;
> +		};
> +
> +		fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
> +			linux,code = <14>;
> +		};
> +
> +		fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
> +			linux,code = <13>;
> +		};
> +
> +		fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 12 GPIO_ACTIVE_LOW>;
> +			linux,code = <12>;
> +		};
> +	};
>   };
>   
>   &i2c0 {
> @@ -567,6 +598,103 @@ fan@3 {
>   					maxim,fan-fault-pin-mon;
>   				};
>   			};
> +
> +			pca0: pca9552@61 {
> +				compatible = "nxp,pca9552";
> +				reg = <0x61>;
> +
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				gpio-line-names =
> +					"","","","",
> +					"","","","",
> +					"","","","",
> +					"presence-fan3",
> +					"presence-fan2",
> +					"presence-fan1",
> +					"presence-fan0";
> +
> +				gpio@0 {
> +					reg = <0>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@1 {
> +					reg = <1>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@2 {
> +					reg = <2>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@3 {
> +					reg = <3>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@4 {
> +					reg = <4>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@5 {
> +					reg = <5>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@6 {
> +					reg = <6>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@7 {
> +					reg = <7>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@8 {
> +					reg = <8>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@9 {
> +					reg = <9>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@10 {
> +					reg = <10>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@11 {
> +					reg = <11>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@12 {
> +					reg = <12>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@13 {
> +					reg = <13>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@14 {
> +					reg = <14>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +
> +				gpio@15 {
> +					reg = <15>;
> +					type = <PCA955X_TYPE_GPIO>;
> +				};
> +			};
>   		};
>   	};
>   
