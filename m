Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA76A5653
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 11:07:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQtN91zvzz3c72
	for <lists+linux-aspeed@lfdr.de>; Tue, 28 Feb 2023 21:07:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O685HJi0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O685HJi0;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQtN46LM6z3bym
	for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 21:07:47 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id bt28so9094180wrb.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 28 Feb 2023 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677578862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psjJwXUn7PRcI5m/RImknQcyjGBuWJdfkTn40E9In1A=;
        b=O685HJi03vIRupVUGwMK3w4GAbWev/8/QRJUFeUKeoV+pRbCuyZCYhJvmLKML1pKGg
         zvsEZf+vrRwiwED7gNsLnNZWVWRdaa0cLa5t9x54L9HkWMGzZk2Wz5jq2b5Ez2J6kBti
         lFjo0EhVsc367UxyH4D0diZF5Any8pF25DtfgDGZ7mQ1yJ2J/dswBpFhoKZMEFRlB/f8
         v3WbxWVP55YCqS51ttaIbQK2qskXUFrdcikMHacTN6h4ijFDcyV+qddqG/fAAN2YmcoR
         H4xydO4idTDtmn/TA0nBH4p+ZH/Dvv4wYQ37EYV34vKta1PulHNccmW08xERAizDAO3Z
         /rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677578862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psjJwXUn7PRcI5m/RImknQcyjGBuWJdfkTn40E9In1A=;
        b=68oGo2nkk4ysgdp6rHg6MOU6TMnCq6IIUxcsKielug69Hza33NHg2JFljph4QADGpv
         i32sNzLHeDEpaTzBSUPiUZjFXW0gY9EEpqFmj65TAy2LKDc28yaDS7GLAec2BN1KVKwh
         jCrFF65XeZtjh+MdP+YvQkHFlslME5RMfJUGi4A5HRAshqWQvh8VBVqhR5zh4xRCZosg
         Eu7H6lHA7zyaFdbi+Zl4SozLcUXcWo+yMrCFq/9c0lv1Hl/Rn+tAC4bCv0fAjqX/+u9w
         MHdSZselohxiSoYMr4KfQJiEK6iFu+5fGp6lkqqUoRUtUtsmv5KunSvdjVs9C6mlv2Ij
         oJlw==
X-Gm-Message-State: AO0yUKXRfUJsnvpwR5/mYYXM1jtOXjbIFXI2YY+h2KXFbtR2Fm7eTRNO
	XjrTPMyFk6IHDERGwlw5uC6rxw==
X-Google-Smtp-Source: AK7set8NDrOuCRgbhVHknjNj61F2a7D1OPwxOsECuVAXugPLWyW5dmyA8KJ7qvgbrPRSnCcZ622l2Q==
X-Received: by 2002:a05:6000:1206:b0:2c7:70d:cc36 with SMTP id e6-20020a056000120600b002c7070dcc36mr1720830wrx.5.1677578862030;
        Tue, 28 Feb 2023 02:07:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k28-20020a5d525c000000b002c556a4f1casm9264878wrc.42.2023.02.28.02.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:07:41 -0800 (PST)
Message-ID: <49d93fbb-f4f7-dce1-167d-086aff88dbb8@linaro.org>
Date: Tue, 28 Feb 2023 11:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: ast2600: Add top-level I3C
 clock
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
 <20230228091638.206569-3-jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230228091638.206569-3-jk@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 28/02/2023 10:16, Jeremy Kerr wrote:
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
> 
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

