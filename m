Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FC693FB0
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 09:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFd0N2cCbz3bgd
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 19:33:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v/qvFBSO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v/qvFBSO;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFd0G6XM2z30Mn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 19:33:33 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id o18so11272161wrj.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 00:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEuMhDtTRyInCB0boBwGOOTw3vKK+wSd5q+B5cK43j0=;
        b=v/qvFBSOYuV+0xErSQhuo4flcS7Nd+4MGv4eNJpeljpVKcRVlO0ImzzeV4V4yRwQDF
         Rd00rcR87JGhvC2jqwzWH91C1SwN6pXaMmyOt87Q5Luc3G/DWsvu5KUm//tIV6xCUcuz
         EL+y1i9zIm03AVRkrsnatQgxoltZyzzhd8Wee8Z802osB5V2mbc2Zu6yAUaOQFf5tccs
         1nYkBvfv2jKY0oAS12RtHa1CXZvZpy1rD1csBDkRwiHvz39z+ODBf7r5GOL77JomYt6y
         Uv4P4qybjKyvFOPM/99NSJwtMnSlLQc1fhUeoOJY2nL05UXGYNQnbYYHJWpxcAaex/iz
         k6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEuMhDtTRyInCB0boBwGOOTw3vKK+wSd5q+B5cK43j0=;
        b=RfKLoNSFXwYy8jZ5dWvB5WBu2Emi/H96F8nVRBsnJ2V6eyxbTTZl3dX96dwbgh+V7J
         UyU0Yqgm9ODDe1cs1AQRCW6+5PJi+oJFHK1FRxoZnxoTuOuyTQBNF0VCDgCszK3bAypd
         DM6S/Ftt63778MQWs5HDEufeeLGGToEgF5JrX+rzWHVwrYPJzOaJxH1/kzotbgvIzipQ
         gyfQi6YiLTMkzNHSMywyeyRm+y/vkJHleueaxJrnco3ZAQluAHUbP4jkbGXLXYGjQUxP
         LyUOHWsKZmT/aTAjvAIviLbfoCdcgFWElXdsAcuGvH6w364EvuGoC93gNY7Y4cGxBbfv
         2Tfg==
X-Gm-Message-State: AO0yUKXP8rAKxGdPWxg2/zdMRU/7uoC119j1kYKnc2W5aQGAzYxJxltK
	47/Z5Vi4nRp3vMiuSWdFMie1CQ==
X-Google-Smtp-Source: AK7set82macE5tb15uEC+cZmeEexWQ0A9YHhP1uRG8SIw9kE96Oxcd3ctJpgCaP9KHVdVj108eHEZA==
X-Received: by 2002:adf:f34d:0:b0:2c5:3fcb:681e with SMTP id e13-20020adff34d000000b002c53fcb681emr10489748wrp.4.1676277211159;
        Mon, 13 Feb 2023 00:33:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a12-20020a5d508c000000b002c55ec7f661sm568329wrt.5.2023.02.13.00.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:33:30 -0800 (PST)
Message-ID: <b59c8885-562d-f680-622e-3859bf7ff8db@linaro.org>
Date: Mon, 13 Feb 2023 09:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: aspeed: Add UART controller
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
 andrew@aj.id.au, jirislaby@kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-2-chiawei_wang@aspeedtech.com>
 <2d0d1866-95f9-942d-57e0-06a5ed17d35d@linaro.org>
In-Reply-To: <2d0d1866-95f9-942d-57e0-06a5ed17d35d@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/02/2023 10:12, Krzysztof Kozlowski wrote:
> On 10/02/2023 08:26, Chia-Wei Wang wrote:
>> Add dt-bindings for Aspeed UART controller.
> 
> Describe the hardware. What's the difference against existing Aspeed
> UART used everywhere?

I expect the answer here. You are adding duplicated driver and bindings
instead of merging with existing ones. That's common issue and
explanation "it is different" is not enough.

Best regards,
Krzysztof

