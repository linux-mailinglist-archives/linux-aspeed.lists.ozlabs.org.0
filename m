Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A201A44FF
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2019 17:26:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LKvZ2XzWzDr3D
	for <lists+linux-aspeed@lfdr.de>; Sun,  1 Sep 2019 01:26:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RT0v7UCg"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LKvM14ZlzDr2k
 for <linux-aspeed@lists.ozlabs.org>; Sun,  1 Sep 2019 01:26:36 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 4so1499092pgm.12
 for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2019 08:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RPm3wNYaAJfeMv33ykpRQXFtymYX8spAHZhOaV4FMtw=;
 b=RT0v7UCg8XIW3feVMun1Z8EQMB0RJUFpGzxMw1XggaH7RCqWOLXKFdZBexNrg2V9so
 ZRXTO8r/0Qv2fszYeE2mWC1o/eaOLIIx1M2tkYCvsOyjFWRxENzkL9+5fL0/vcFGj5Pu
 wpue46UQhSslVUplYU1QWSQFC13RMGc+Iu8sl5t1kj3Apy/tTdHM9ZCn+pQrYBzxQ42r
 cXcRbHVEa41cQyNUu5T1p6zTJNRrj+PWxt1J31sIuHQ2DPVnCzUq5bAHrc0XeL2aOPZY
 UWKQIV/AYVtY1yVgjGAzVkN+YvuK0iE58R7XN2lCcwP8GUxYzH7LO6oHdFmYNdmXvEkE
 5YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RPm3wNYaAJfeMv33ykpRQXFtymYX8spAHZhOaV4FMtw=;
 b=YX5RIGhfsv20u/bqciEFWxlhqlp9AWVs1SMkhBQyjwqBDLkOPuye2xNelby+pZH+Ys
 g+M180P1k8KWGcl+tRqFRIf5Xc7Lv8PcTyHBcodpB7cqQDQsZQDX1IYLA1WFrhpo/FK5
 nJ0artF7ZUzj0Hs3kDGcsvnFcp/nYWlV2zCdYjruoWxYziI6CdMm9Q3g1KfPJsPrJMN6
 M5JTjcjEfzIZeWp0bdjzF+A3VAA9fZ7AEJ8TommQ7iso+iv7eg98eJBrubIhqcDLzcRp
 qRaRVn63eRGz2em+pNlPxEgR72ViNTqsG7AufPjQG+NgwH2FvT5c50pSLqEyfS6a3CrJ
 iC2g==
X-Gm-Message-State: APjAAAWSHHEd0ccZ97dhdH+7YUku0qeNwKzpesvMUhMDKAg1zfx8KAJ4
 tvRcRxNRSKmGmqXx+oY576Y=
X-Google-Smtp-Source: APXvYqyJqEFxeB6QZitGffSy1/9nDmFnIkSMbAmBdxvl613w1CBE+EMOAAgfFHTaVNzZDYLyc85W0g==
X-Received: by 2002:a63:ec13:: with SMTP id j19mr17399821pgh.369.1567265192358; 
 Sat, 31 Aug 2019 08:26:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f188sm3094603pfa.170.2019.08.31.08.26.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 31 Aug 2019 08:26:31 -0700 (PDT)
Date: Sat, 31 Aug 2019 08:26:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: Document ibm,cffps2
 compatible string
Message-ID: <20190831152630.GA8907@roeck-us.net>
References: <1567192263-15065-1-git-send-email-eajames@linux.ibm.com>
 <1567192263-15065-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567192263-15065-2-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2019 at 02:11:01PM -0500, Eddie James wrote:
> Document the compatible string for version 2 of the IBM CFFPS PSU.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to hwmon-next. Note that we'll still need review from a DT maintainer.
I don't see any problems, but then who knows.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> index f68a0a6..1036f65 100644
> --- a/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> +++ b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
> @@ -1,8 +1,10 @@
> -Device-tree bindings for IBM Common Form Factor Power Supply Version 1
> -----------------------------------------------------------------------
> +Device-tree bindings for IBM Common Form Factor Power Supply Versions 1 and 2
> +-----------------------------------------------------------------------------
>  
>  Required properties:
> - - compatible = "ibm,cffps1";
> + - compatible				: Must be one of the following:
> +						"ibm,cffps1"
> +						"ibm,cffps2"
>   - reg = < I2C bus address >;		: Address of the power supply on the
>  					  I2C bus.
>  
