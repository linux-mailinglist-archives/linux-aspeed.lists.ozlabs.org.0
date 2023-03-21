Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4B6C357E
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Mar 2023 16:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgwKF1K3dz3cdK
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Mar 2023 02:20:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RIZhyIZ9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RIZhyIZ9;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgwK86Bs1z3c6m
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Mar 2023 02:20:28 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id r11so61129358edd.5
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Mar 2023 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679412025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Da2jxuDTdjMSjUZ5oJaHx1frHV9AyEaeWV3IO9K8Rs=;
        b=RIZhyIZ9n0aS3DStByjSKQu/175aENkML4VQIuqDuR3TrTGuDi59cBsHTE2ZhqcIwd
         rTx4kVX5fZoY9GU7W/OPKD4Rps8U1hUsSqnzkkytb/5KH95gWW8BVcSC1Y4Kv3oCY7bM
         H4QUrxopAbXaCgr5BGAc+kmUs3WyY+ufwfnGEzXYIt22mDWF0WnoIaWKsm+GjRT9uwIO
         KKwlC0CEdTABkp5bZcBCE1AxjjQXhIWG3gW8DNVYBgLBL4u1XzgFA4T5uCijk9yP7oWs
         skNsxpAnAmm4Vj0yN8ZHUUcZv8mLj6rvLxWbnj7u2KrLMtdJSitv58VRNhVpfUdRatzm
         dgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679412025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Da2jxuDTdjMSjUZ5oJaHx1frHV9AyEaeWV3IO9K8Rs=;
        b=eopNb7uZjusL1EXTp0CPgeRqFg2BIPjgvePQ+RVBDqjVshXh9vdaee5wJ2x0FYs5Af
         98Kj4fws96bwq8E9fmNk0IGHUKEto1+VA0UhrjzRZMxCVidCvCI1TA8SPEj4+H9eSyJ0
         k0YpmSUpwBbxAMBMgcZhEMOZoH1jFwCZwGCS5v/t0HmXYuhHfyJIxeaHhR+oMplstjxl
         nu/9FnNbWorsefs3+N9ZKUBp35EbrFOXKnIddHOuxKbMXZ9zQBUXrY32F3naPeRAt8ct
         1JIh7iQcYt7oXVve+5nKHj1UQnHafDaPXmdPjuFPjhmEDI8EfOMlQmACr4MPyKWT65Xm
         L6/A==
X-Gm-Message-State: AO0yUKWm49PIIS0zwmsAwFo8Zc2bpC0TTMALSCsSjoqGI1ToRENOuM2M
	17wF0WDlweuES5G0XPllmHxNPA==
X-Google-Smtp-Source: AK7set93GdFlp6UxzAJRhP+TpVPdJfQCztzCBUEZMkFY2nmybXMPfjIo0Fvf6G9cxJLVi/gEQ8Umdg==
X-Received: by 2002:aa7:d84d:0:b0:4ef:9bf0:7177 with SMTP id f13-20020aa7d84d000000b004ef9bf07177mr3338986eds.9.1679412025077;
        Tue, 21 Mar 2023 08:20:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id y2-20020a50ce02000000b004c0057b478bsm6493930edi.34.2023.03.21.08.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:20:24 -0700 (PDT)
Message-ID: <bad282d5-9e40-a99d-0abb-d04163dcf080@linaro.org>
Date: Tue, 21 Mar 2023 16:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] eeprom: ee1004: Add devicetree binding
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20230321151642.461618-1-eajames@linux.ibm.com>
 <20230321151642.461618-4-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321151642.461618-4-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 21/03/2023 16:16, Eddie James wrote:
> Add an OF match table for devicetree instantiation of EE1004
> devices.

Subject: There is no device tree binding here. You add OF matching (or
support) to the driver.

> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/misc/eeprom/ee1004.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Best regards,
Krzysztof

