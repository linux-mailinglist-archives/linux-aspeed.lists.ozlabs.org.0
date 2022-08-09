Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C458DF32
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Aug 2022 20:37:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2MJ20zynz3bXR
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 04:37:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.169; helo=mail-il1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2MHv373Pz2xn6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 04:37:29 +1000 (AEST)
Received: by mail-il1-f169.google.com with SMTP id g18so7011343ilk.4
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Aug 2022 11:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=p1zG50tbys0VZPxrDxOi0AKOdulYGynEm1N8ehSkAjc=;
        b=1cQGWvrPxSNdGCxD1CRKuEyjb3z2taszaOW4tL+CFI/M13kvrktQzqcJmB2G6mzXdR
         Ga6C/ejmTY/EfgWdBR2dlrKUx3hlQjh+QSqME19gldjw2/szWr8aNKrOm0EInZjBE9+/
         HPl4kfZKu7ybzToMLPV+bJuFMTk2lntTPPufgJRrXIvX0OPnUJu4nzha/ZTXvyWWYuch
         5i4Du6VGJg8b8wNoqguzWyMjlbEeXi9MAuowOjMJFzHhpREwSSONO6TG48LBNBZMYk08
         QhdKjQn9n8yVoQCerp+P+tmg127oEHMUyE+bPDjRlxvmOZ42S+am597lME0d6SG/LuXo
         7Q3w==
X-Gm-Message-State: ACgBeo2FXsBU2kvow4/YxruLHPBPtu3eHvAl/DECmjPjJI5icOKhhhd2
	jV1OTCGsAcsj+qDLXdaeXw==
X-Google-Smtp-Source: AA6agR5ZnzgIeG/U81elDF8ly7zfS5wNx0qpukW37TAtB8c0f3T0cYufxFZ+ihA+ycvOJC14/yqQmQ==
X-Received: by 2002:a92:c247:0:b0:2de:497c:1068 with SMTP id k7-20020a92c247000000b002de497c1068mr11482146ilo.140.1660070246461;
        Tue, 09 Aug 2022 11:37:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s23-20020a0566022bd700b006849908ca7dsm1409961iov.36.2022.08.09.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 11:37:26 -0700 (PDT)
Received: (nullmailer pid 2163511 invoked by uid 1000);
	Tue, 09 Aug 2022 18:37:24 -0000
Date: Tue, 9 Aug 2022 12:37:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc
 compatible after rename
Message-ID: <20220809183724.GA2163454-robh@kernel.org>
References: <20220804150935.121890-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804150935.121890-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 04 Aug 2022 17:09:35 +0200, Krzysztof Kozlowski wrote:
> The Nuvia DC-SCM BMC board compatible was renamed iin commit
> 7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
> so adjust the bindings as well.
> 
> Fixes: f77024c80147 ("dt-bindings: arm: aspeed: document board compatibles")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Use proper qcom compatible.
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
