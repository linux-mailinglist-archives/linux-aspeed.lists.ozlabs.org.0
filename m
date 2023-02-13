Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4664B694749
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 14:43:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFlt51GKNz3c3w
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Feb 2023 00:43:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G96Ql8Wh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G96Ql8Wh;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFlt10sXHz2xHH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Feb 2023 00:43:36 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id y1so12286905wru.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aopjYrYB6lNxYdmLh60CeH28kAqTJY8+y17BTONkm+0=;
        b=G96Ql8WhMUdl8LmADGnm1ExabL/RlLv9ySNC8GNvvQyzlezQ7Kr70m2MVZmkBz5Fgv
         g03THpQcqCU09HDy5ojOEYHaULpDiPriTblIcr2deFupSKYrMctqD/FMbxDPkifVyJeV
         c5uutP5Pbz8ofHKlnnZ8MCP45vi1QP4q92WrHxAvHcIdWruhZLsWyfsy4TrSYHcFrylk
         5toCIK1+XMiJH+a/kkANBi/p3wv0UZQlueLiLB9pEpGPRjzgF1rd3XS3C1EcYKuQIdEz
         Vs9LfLMu8nPfCs7J0T9d/jjjdk/X/U1koixz1t4d112MsYXnbghp/cl28AVVb2BFCcLC
         zdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aopjYrYB6lNxYdmLh60CeH28kAqTJY8+y17BTONkm+0=;
        b=VVAiyFnfYmY+bknxegAb0vVYIqI5W9RBpAtF3O+Sj27+fph5ai/5pNgQmGXpfHJyHC
         0LQNrEjXhwf/K1JQhNGWfbnf+RWCc0zvfvkkEdehGCd+hp97SUmxH8QyN2LP+dhWCEzc
         hnLZ7DAubPibbQ9smwC8qZoPecv9nTzctRwylgFVUu3+ohjJtZ2hLACdampRcuo/Qul7
         0fKhccXlshhWmmUkch/8nsqlNiOtDuXiTY7VoZQX6RxQQUjqV4dAYoaMt1IIUAV5GU7H
         ZaEcPCCv5n8Olis0VvuiyZN4bI2GqLOnUg3HLXf4lLoRBUtH7e5nmybT5HaTaJ6jRPNX
         nxSg==
X-Gm-Message-State: AO0yUKXLqxTSKbHPLNx9FwEfrMZ9vsLBJYROai4xTC7HVGdKoRh1YK9O
	3DqdCDXvBaOikhKVJ52/bBMEjA==
X-Google-Smtp-Source: AK7set/x8KbCQcviVr1136A2VxVn4Q9/9dCl7s8Z2qc2gwfD6HGMpAYHATlJvtf9ep+5w/6w8o1ogg==
X-Received: by 2002:a5d:608b:0:b0:2c5:6036:2567 with SMTP id w11-20020a5d608b000000b002c560362567mr700741wrt.11.1676295813865;
        Mon, 13 Feb 2023 05:43:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t9-20020adfeb89000000b002be0b1e556esm10469056wrn.59.2023.02.13.05.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:43:33 -0800 (PST)
Message-ID: <bc0adda7-9636-b1f5-3fe4-67ba6a3ddc9b@linaro.org>
Date: Mon, 13 Feb 2023 14:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: ast2600: remove IC36 & I3C7
 clock definitions
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-clk@vger.kernel.org
References: <cover.1676294433.git.jk@codeconstruct.com.au>
 <1b9bb33e75c0a84880035954d500a6e608668b99.1676294433.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1b9bb33e75c0a84880035954d500a6e608668b99.1676294433.git.jk@codeconstruct.com.au>
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

On 13/02/2023 14:24, Jeremy Kerr wrote:
> The current ast2600 clock definitions include entries for i3c6 and i3c7
> devices, which don't exist: there are no clock control lines documented
> for these, and only i3c devices 0 through 5 are present.
> 
> So, remove the definitions for I3C6 and I3C7. Although this is a
> potential ABI-breaking change, there are no in-tree users of these, and
> any references would be broken anyway, as the hardware doesn't exist.
> 
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

