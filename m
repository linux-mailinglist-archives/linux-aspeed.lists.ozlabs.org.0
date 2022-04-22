Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C650EE8F
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 04:12:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQPR1HYxz2xCB
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Apr 2022 12:12:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dFaXJiaZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dFaXJiaZ; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl5SH2K0wz2y8P
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 17:21:32 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id y10so14572934ejw.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Apr 2022 00:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mozxGpVNThVpDxU3FVNcRd3/bjSVUfsXgVBZGesYHcQ=;
 b=dFaXJiaZInJnghQJtlvgdh4lXAnWTxUSVihj7RkPF/++bL8fVbLlZ/pLUAlKoZh/x8
 /iRlc0YIE88TB85pKs95phIGUI/VkIX6cRyEPwLOu+jObgbS6pxqnNXgPu7s+7vukl5h
 lcuad8p9vJHqQyAzwldWPyxExC36yVWvnDVof7Vbm9EN2N0axmsvQY9kU2I1T1X4XSgE
 FGiihVPBg//1Jg5T7zeEPibKuZVkjKFrMhSaB2QQBt/HGD5BAFODvxz7MQYEk95yZU1g
 +1OKDbmG2bGMtaCmlNZ68Qfq7vVUr4uQVSSjEb6KQJn9j16zS2FsiU9Xige6DKLdCv4d
 wYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mozxGpVNThVpDxU3FVNcRd3/bjSVUfsXgVBZGesYHcQ=;
 b=7LKrHDDBaw0v9PUCexJVWFEI5V16pBnQXDKEjhAhuWNuYNllABFgDrwjvgZkGhEw12
 CIfLTCkpoQW1Zma95rGxJ+55mdk99RvMrxYcyweS4OIQORZ009sWCHnZllPzz8z5VxgW
 H5Na6I7pi2sygHyqoGLZOHCqEsWoKpO0tEs56znUi74VXmU2wxHGdTehYrhbz7Ldb2Rm
 kNDiKXgV+VBtBv9bEdA6gilKV4zHM8X/LKzKtSX79mX0oce71Z30CYlC+M29l3AEc4b3
 zGMUv3euC1ZJXJ+S6U6N/IERS+R+UELJiJTGQ7HJOqDs3qaIsYW8Tq5YdFXI+heItu52
 Pp4A==
X-Gm-Message-State: AOAM531fPaJiJdr+M50Bu8wh4SpOgh3PF5eLs5/w5bEtyhQ9kYGtjQbT
 cvPc/aQiLqgTPIrn3rrWQd+KJA==
X-Google-Smtp-Source: ABdhPJwijLHu2gqRX7mBCn8elSy2a/cyiAkiWa5IL9L5CDIleQFKOvKyFF0yVvaYGr/UJ2+gL0DWmg==
X-Received: by 2002:a17:906:7f02:b0:6cf:86d8:c31c with SMTP id
 d2-20020a1709067f0200b006cf86d8c31cmr3012426ejr.518.1650612085191; 
 Fri, 22 Apr 2022 00:21:25 -0700 (PDT)
Received: from [192.168.0.230] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 f5-20020a1709067f8500b006da68bfdfc7sm471328ejr.12.2022.04.22.00.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 00:21:24 -0700 (PDT)
Message-ID: <55cbbc16-5769-ecd2-e65e-c3b39a34dfbb@linaro.org>
Date: Fri, 22 Apr 2022 09:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-3-quan@os.amperecomputing.com>
 <153da61e-dc9d-467e-221c-b48d6f54c6c2@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <153da61e-dc9d-467e-221c-b48d6f54c6c2@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:21 +1000
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 22/04/2022 06:16, Quan Nguyen wrote:
> Added Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> as I'm not aware of the email change

The email change from @canonical.com was 1.5 months ago, so it would be
better if rebase your changes on more recent Linux kernel. You get all
proper .mailmap entries.


Best regards,
Krzysztof
