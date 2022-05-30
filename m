Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3EC537467
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 May 2022 08:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBQc153rYz3bjX
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 May 2022 16:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zI0PXh8C;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zI0PXh8C;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBQbv12zKz3bkR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 May 2022 16:34:02 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id f9so18921640ejc.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 23:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6JI8S2sEVNpLFXVCCEM7RQxXwQYpgOWv8/i6hytBxdw=;
        b=zI0PXh8CUyED8Aak6eOmi1pxsLjx5iKfEyhp11LMUldq9XFq2NWH8BDXYIBnH+GXzu
         AJhdwBrl/HQ7z2DFlsk5iIZ9GGMKbdvq7WFOv8XsL3ni9sP5RAMDaUw7GZReXuyf/unq
         t6JshwYWAFLqRkE7demdu8wDwWO13TszkVQyVTORH+qUU6WdRhjCCtgQBd7q2WvLW3Bf
         5kULMLzBV6kXyaXywJzA3k62rdn+HVZoZgW3TUU4k3yYrSThwo38Q5WhoPEG6qIj+Dwx
         mTUc84qbWdXLO50Z4mzpvy2NVjZYNZ1PvNKr1UUdYznfM+cmo2cro+UzgFQ6cJP0rCEa
         mtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6JI8S2sEVNpLFXVCCEM7RQxXwQYpgOWv8/i6hytBxdw=;
        b=paOiW4KPjusgATznN5MBi6pLv9slMkKboXme0Vc+mF5oKdrkW0Rd8eoi28bwyld9vf
         ioqrLXqWaj44M2RIQ8rwlm6bkbXUjBjDAPLO8I9ZIG7InND/6xfN7HqTU4XoebxRXfTi
         DTSmGmestBiJ9AE0lFAjQPuT+cbx3ED063bZNtl8jQhxxcqAo0h89hTHaacuhgIDXeOB
         +0X8C43PDFQ4wXLsTNwVDsdQfWYcnm3My9B2QB4xkTyVrLl99qzVL3tfCVGnTppEUn2u
         9KG/PUYohwMprrFYUIjTM5EceiDZrCj5gtYmnyF2IhbqfdxSs6sgFg84h6K6yNm5r5EB
         LfHw==
X-Gm-Message-State: AOAM532x9XvCD47SGffJQHaRIxNbmFV8xVHFHzLwWCgfu+L8oVC9aHHP
	aCdS3I18ZC3TFfiscNPY9btqlw==
X-Google-Smtp-Source: ABdhPJzPKJqFPcOz5A+5ihWfyOrl8uqS8EvJFQzv0kmgEA19KzEXCpq17Xg4yZLMD6GQ3DGaOgt0zA==
X-Received: by 2002:a17:906:3a92:b0:6fe:9029:b62c with SMTP id y18-20020a1709063a9200b006fe9029b62cmr47653469ejd.569.1653892439407;
        Sun, 29 May 2022 23:33:59 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w7-20020a170906130700b006f3ef214dfesm3680224ejb.100.2022.05.29.23.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 23:33:58 -0700 (PDT)
Message-ID: <0c08eb44-285d-975d-ac6a-f55ccfb34420@linaro.org>
Date: Mon, 30 May 2022 08:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add USB2.0 device controller
 node
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felipe Balbi <balbi@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Li Yang <leoyang.li@nxp.com>
References: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
 <20220523030134.2977116-3-neal_liu@aspeedtech.com>
 <TY2PR06MB32135A0DAA9F152E2498CD1C80DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TY2PR06MB32135A0DAA9F152E2498CD1C80DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 30/05/2022 03:27, Neal Liu wrote:
> Gentle ping on this path, thanks.

It's a merge window, so now not much might happen. Please resend in a week.

> 
>> -----Original Message-----
>> From: Neal Liu <neal_liu@aspeedtech.com>
>> Sent: Monday, May 23, 2022 11:02 AM
>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring

(...)

>>
>> Add USB2.0 device controller(udc) node to device tree for AST2600.
>>
>> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>

You don't need my ack here, but anyway FWIW:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
