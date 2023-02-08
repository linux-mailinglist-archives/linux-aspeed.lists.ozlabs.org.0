Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7168ECD0
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Feb 2023 11:28:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBbn905LKz3cgR
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Feb 2023 21:28:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V3Oqu9vy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V3Oqu9vy;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBbn05v4zz3cMT
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Feb 2023 21:28:18 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1085558wmb.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Feb 2023 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPx3PngIR8DhUNEkJNoSw3b5IoN0UlUPn06sByvNhzk=;
        b=V3Oqu9vyzZwsIQff8hANhqv/sm6hI+RKNCL8L1ddqodvuTOigdfNOR1sJ9krPX6n6F
         lrVHKVnTuNA2PvxZnsCxzNEt+F/kTAOmjdHBHAyTd2GHzXeRigEFfEuF0+AcPs7mVn/5
         nZU/78C+8Xit7MVWuo+IRGFPSTQDPS2v1lr0tnFqRm8DCvUcQnluTmFTdnyV/9skwFlI
         /hLhIFlS/Jr/49Og9RN+S1rXtDGPM6fk9Qxuq/LpLXYk18JEd/vov3+7C0MQwdLzujPG
         aMWaFoEM9PYEdPwHdA0i0mmd+4U2oCk7JOfs67O/dt6oLU+umO0nBcFISwIMcJ3NI4Q5
         uCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPx3PngIR8DhUNEkJNoSw3b5IoN0UlUPn06sByvNhzk=;
        b=cH2QivFJKpmv+NbpBBaultXUfLlayiImaUrZrbXiVO2MBbFkWZlqzNmvEPbhHRQkHS
         Joty6qqjb//T7lsseDnyubyDhpLJWQXETDXlPQmZtpPNHwAnBu8c1yYQQvxnrRoi7apr
         2g3FtA4bENEhIxKpfm+mahA/W6wcM643TCZHcxP58ecrdLxI7w4pH9pqw+r2rSBgAZtS
         Dn3OLogLm1pJG7bDoFWN9gbzs/t27ujrQ8lweeKX2Y34y+BB6Gf13GFx01NI9d/43HY7
         hRd6Jq0yyJei+/XkqgAQZRtjQStue8ERE8rAG/tHNU2aNjpUoAknMdB+P8AGD7upGOV7
         tOVw==
X-Gm-Message-State: AO0yUKXE4Eiyh8yU4kNBjPW86wlAoT3ugadri5Igf7cq/PvrM5s+Hqii
	NGw4AqG07aFbS8wixdmi8I/04A==
X-Google-Smtp-Source: AK7set/WsTpPNnLmbeDYcwU6ylA0LbbTvFVJcsPMQVF9uUqlxofQa+jEXReXVQ6i+OXENazVLtUXJw==
X-Received: by 2002:a05:600c:1716:b0:3df:f7cc:4da2 with SMTP id c22-20020a05600c171600b003dff7cc4da2mr5966396wmn.16.1675852092080;
        Wed, 08 Feb 2023 02:28:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b003dff2b493c8sm1601687wmb.36.2023.02.08.02.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 02:28:11 -0800 (PST)
Message-ID: <53818676-1e4d-2e58-00d3-ab06b3741fc2@linaro.org>
Date: Wed, 8 Feb 2023 11:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for Ufi
 Space
Content-Language: en-US
To: Jordan Chang <jordan.chang@ufispace.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org
References: <20230202081843.2358-1-jordan.chang@ufispace.com>
 <20230202081843.2358-2-jordan.chang@ufispace.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202081843.2358-2-jordan.chang@ufispace.com>
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 02/02/2023 09:18, Jordan Chang wrote:
> Add a vendor prefix for Ufi Space (https://www.ufispace.com).
> 
> Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

