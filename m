Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CD5455D9
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jun 2022 22:43:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJwzX6lpzz3bsr
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 06:43:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.42; helo=mail-io1-f42.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJwzR1XDvz3bqW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jun 2022 06:43:30 +1000 (AEST)
Received: by mail-io1-f42.google.com with SMTP id d123so4401675iof.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jun 2022 13:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4QdkGnXlMNTV/iA2nVuQmtTBo6O4LHEpfmqPEMw61IE=;
        b=ynRwIZk8UMswj/RqyqvFsEFvDjoEoeWWjkgCZb+q4Kuj+jch15JwyqpHYpO8LUktnz
         qQ1Z9Hdy3G+ehQXmxI7xkuGEcEn/QDXbPWZfQha6mVOyaKRQ+05jZP7P8ZI31HhA8zbG
         HP3GlCPLdSWfB21WWYC7bK3vtoQiOM4DH/OLzFFkvS044PXjqJybikdBF6pb1Bf24IRY
         6aZwY0Qw2v+QQF1JfYEUVmfmkfhDyob9536AgDED3pacbmK/LIPGNBTkE1zZjeNsSlAV
         FrPGGNq71zG64nmvWgmndPAJPqzGWo2x1GwYTzG0FlGN7aVPcjK9jG2vM9Im7b/ptF10
         or2A==
X-Gm-Message-State: AOAM532ipf3c5z/T6do6DaqQXaU/+PKrWRdrB7zd0cI6dsRrHLO8kkos
	xMJWxbcsIYrKYypX85I6YQ==
X-Google-Smtp-Source: ABdhPJyxJ/HuznBArSJKD+jpsjHU64cpq1XFDav0yTOf5ZBIjBue5UZbxavVH/a76BqrcQhDd56AHQ==
X-Received: by 2002:a02:1986:0:b0:331:5c52:5b9b with SMTP id b128-20020a021986000000b003315c525b9bmr22177136jab.69.1654807408230;
        Thu, 09 Jun 2022 13:43:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m8-20020a927108000000b002d3c93ef865sm10755865ilc.69.2022.06.09.13.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:43:27 -0700 (PDT)
Received: (nullmailer pid 68193 invoked by uid 1000);
	Thu, 09 Jun 2022 20:43:25 -0000
Date: Thu, 9 Jun 2022 14:43:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: document several
 vendors for Aspeed BMC boards
Message-ID: <20220609204325.GA66986-robh@kernel.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Ken Chen <chen.kenyy@inventec.com>, David Wang <David_Wang6097@jabil.com>, Steven Lee <steven_lee@aspeedtech.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 29 May 2022 12:49:22 +0200, Krzysztof Kozlowski wrote:
> Add vendor prefixes for manufacturers of Aspeed SoC based BMC boards:
> ASrock, ByteDance, Ingrasys, Inventec and Quanta.  Move also bticino to
> proper alphabetical place.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/vendor-prefixes.yaml     | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 

Applying this one to avoid any conflicts.

Rob
