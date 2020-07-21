Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91122850D
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Jul 2020 18:13:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB3YX0cM0zDqkd
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jul 2020 02:13:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.194;
 helo=mail-il1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB3YH42rWzDqXG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jul 2020 02:13:23 +1000 (AEST)
Received: by mail-il1-f194.google.com with SMTP id k6so16891948ili.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jul 2020 09:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3hEvd6e5qQIyO2q50icuN5FjIQ5q4rwekadksksXza4=;
 b=hqwLcf/J9Y5wFbZ4UIwkm4XN8bMdC+cGCmaa2+G6kZzaUsyp/zRYasd3c8XzdUSvxc
 9EjsvD0hH1hpqICa1uyJLIz3Ow2rj/6Y1WNlmfBV6KD2FilWamVkRyRicnKUzGWK9kfm
 csUkEKPSFmmI4B/gQCmZIuhUv5E6wbTIroK3U0LNkelt3tTClyTIvOYoTl8bCYHvd65a
 +/lbtBrOO6HRzRvP2G8TTl0T7Lrg42RBfUbv/fVIsUrX1Qz7ezsWsjzgP4WC6lOJ8f0X
 KafP5o1qUk5/306jNzCwJno7VMKquJaPnuOFu8JrN9487PKb04Ng5KlZVLoQm3gqNagS
 uOIw==
X-Gm-Message-State: AOAM532yYtCUdPLOApR593ymgPDUIzQNmMOLyzCS71fCebEG/ql1G2yy
 8+dDK8OJxqnMi+JWtTkOng==
X-Google-Smtp-Source: ABdhPJwZyjj1eCmbDB8qodPjQFtYDmTZBEcJbwfaZKYhQLlgyU4nhZLjz4sJOcRtVBR5wxuFep/Rtw==
X-Received: by 2002:a92:58d6:: with SMTP id z83mr28467802ilf.186.1595347999985; 
 Tue, 21 Jul 2020 09:13:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b14sm10999389ilg.86.2020.07.21.09.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:13:18 -0700 (PDT)
Received: (nullmailer pid 393136 invoked by uid 1000);
 Tue, 21 Jul 2020 16:13:17 -0000
Date: Tue, 21 Jul 2020 10:13:17 -0600
From: Rob Herring <robh@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH v2] dt-bindings: aspeed-lpc: Replace HTTP links with
 HTTPS ones
Message-ID: <20200721161317.GA393067@bogus>
References: <CACPK8Xc_iwvRtUVjY8G8rS8UbZf6-Q6FTGaNweJXk06A=Y459Q@mail.gmail.com>
 <20200720212110.64214-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720212110.64214-1-grandmaster@al2klimov.de>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jul 2020 23:21:10 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  v2: Left only links to be only HTTPSified.
> 
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
