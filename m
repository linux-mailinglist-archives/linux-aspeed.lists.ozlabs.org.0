Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48906957962
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJL1dQkz7BZQ
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lcUGcWY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt8x561gDz30ft
	for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jun 2024 20:24:56 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a62ef52e837so542955366b.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Jun 2024 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717410288; x=1718015088; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqA1PXrwcCN98Nii3x8SpO9ZeqKqzlhOVt86I0o4hY8=;
        b=lcUGcWY+v9mV2nSP/aMfdWXA3ZgjQZhbKiKF2hnWdu4nlKPteKb/CwNKMLYnkZbt47
         JHIdpz1tT7keSpYYVkQXJgUeTh59B4YXBsjAgI9HYoVRl8KWWet/CyBrZRg5DvRkBor/
         ++JTOJ5ysnDSxy5jY1zmfVH0N/efKKu5eD9aM65ptV5WXpHoABjGg6xVM9fFN0KbRMP2
         yggBpwrfasQxrI30/cLQZxlckRTOev4KE5ChJv4fSQ7+hB9yxX6nqBGPSoaEfwIkT6vu
         ZECi9Ed/XY+bXa/9/9APMdBzDMnV2S9SVjWDCAVu3vsDCyzrkzGRY3UgszV+et00lkpw
         aTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717410288; x=1718015088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqA1PXrwcCN98Nii3x8SpO9ZeqKqzlhOVt86I0o4hY8=;
        b=SxYOsDW4mzCE9ze3SszOwrU9tWbyyW55o7pcuJYOYcDOJLSolljY9/AEZJhTD1kkQ0
         rGcU659s0LQC4wRpXX/92G6HIwFqbjG5wqs/HJcuEGf5lrsiNJQANqS48zjufpIv7N/R
         bWpWyxC6tn9u4x0l3wGaEYk+dfO5cUDQaTG03CtMdu9aUUFN53qhKbxWwQKLQTvI7PQc
         JZ0EkWOXewVKSbYR03M7jZTPh1VANDS0W2EKmjd5etjVGYmvKNzFeCMZ4cZC1nRcSWqZ
         GDk1ttjS8DAs4SzEBttqRTLBDgH5v9iUfSDDN77X9VRo3M0yAGx7IazuIh09Y+gcWuxz
         3O3w==
X-Forwarded-Encrypted: i=1; AJvYcCVcnm8vvNv8bpuqPl+cy+JaHsUtntY0JRyUqtWtKG3hX6/sZs5C49Jbsy83OObKpUqWv3y/xUzlJYXhCXvGnBQ0n18PmIHvq+8M+SClNA==
X-Gm-Message-State: AOJu0YwwT8PFDggY+F00+YRv6BNIYgrDzvDb6PwJ6m0sQlIjnO1zGmpl
	n5Ym5QQxCE/ob1llX3M0o65/sgEq2fAeITsiweRKWLshWYv9RAoS
X-Google-Smtp-Source: AGHT+IF1CtcgDyhj37LHv92BCOpjLvOTVmffDU90JlA3fyLw8/2VlZTAH8nbqfafha5QeK5FmMjkNQ==
X-Received: by 2002:a17:906:da89:b0:a59:a85d:31c6 with SMTP id a640c23a62f3a-a68224460b9mr684563466b.66.1717410287636;
        Mon, 03 Jun 2024 03:24:47 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b6ef0d8esm328804366b.105.2024.06.03.03.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 03:24:47 -0700 (PDT)
Message-ID: <a61bb06d-bb06-49d3-82e8-7262fdbb0031@gmail.com>
Date: Mon, 3 Jun 2024 12:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm: dts: nxp: lpc: lpc32xx: drop 'clocks' form
 rtc
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
 <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 13/04/2024 22:22, Javier Carrasco wrote:
> The RTC does not provide a controllable clock signal (it uses a fixed
> 32768 Hz crystal, the input clock of the SoC). Remove the 'clocks'
> property to better describe the device and avoid errors when checking
> the dts against the nxp,lpc3220-rtc binding.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 974410918f35..f78d67e672b4 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -384,7 +384,6 @@ rtc: rtc@40024000 {
>  				reg = <0x40024000 0x1000>;
>  				interrupt-parent = <&sic1>;
>  				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk LPC32XX_CLK_RTC>;
>  			};
>  
>  			gpio: gpio@40028000 {
> 

A little reminder: the rest of the series was applied, but this patch is
still pending.The nxp,lpc3220-rtc binding was moved to trivial-rtc.yaml
and it is already in the mainline kernel.

Best regards,
Javier Carrasco
