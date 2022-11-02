Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E3616714
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 17:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2WxL2Clzz3cJd
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 03:07:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.43; helo=mail-ot1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2WxC4tQ1z3c7H
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 03:07:10 +1100 (AEDT)
Received: by mail-ot1-f43.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso10569285otn.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 09:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th6/ZO+U3Z/edcN2KgziGNJueIvFPLRfv4u6mt7jrck=;
        b=kpOLpyEd42dlSXQgfEevXw2TtM+VW4pwyhklFSix8jRC7cVvrUzhMJ8CAUY/k1SluL
         U29MTnHROphK7Gk6YMlLOTu2y9eU8It97IHed9sx9NwGju+vfrcLf9/ULkLnXz6DPzTR
         wNzBeKn+yEcNBpZeRpDtaQYM6uD6FFtU6uJ5cKCFUMYn6ODhKjCJ2n4p45/I+e4Mz7a7
         f3h/f5a1e0i0luQkb8wix2YsbuRz25C4KUYD65PttrJF67gJwRV0ax5kCrt1dEZRDPUZ
         Euqk9bUeaDdJk0Q43xwJRq0ZF66VMgMLIiDtRfUTa3cKmI4JD9spbOHwrKxY98hEM9ln
         FYOQ==
X-Gm-Message-State: ACrzQf02rV7hw6HDrS6n/Tzi35/Vi33NZuto9qNQwaqBcVP6rk4ZaOmu
	O2TpH/rx//brMHkKdzJD+g==
X-Google-Smtp-Source: AMsMyM6xwEveyhcFQBvttzseNwCLpoSlmkHUq7T6+pg7ZTNvsWy4AVnWNkyGh5Hr2jjsAMZHehEz9g==
X-Received: by 2002:a9d:63d4:0:b0:66c:572d:e067 with SMTP id e20-20020a9d63d4000000b0066c572de067mr7949792otl.86.1667405228068;
        Wed, 02 Nov 2022 09:07:08 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s37-20020a05687024a500b00127d2005ea1sm6215390oaq.18.2022.11.02.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:07:07 -0700 (PDT)
Received: (nullmailer pid 3979089 invoked by uid 1000);
	Wed, 02 Nov 2022 16:07:09 -0000
Date: Wed, 2 Nov 2022 11:07:09 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: Remove the property
 "aspeed,trim-data-valid"
Message-ID: <166740522806.3978983.397017282901820216.robh@kernel.org>
References: <20221031113208.19194-1-billy_tsai@aspeedtech.com>
 <20221031113208.19194-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031113208.19194-2-billy_tsai@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, jic23@kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org, colin.king@canonical.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Mon, 31 Oct 2022 19:32:08 +0800, Billy Tsai wrote:
> The valid of the trimming data will use the otp default value as a
> criterion.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml    | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
