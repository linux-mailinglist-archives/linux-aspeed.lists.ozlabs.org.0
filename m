Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B314E54E42
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 14:04:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y4bQ0BWXzDqN8
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 22:04:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="jPIyrkQi"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y4bJ39vTzDqG0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 22:04:41 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id a21so15971678ljh.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z4XsQI9r3zgLSCqnQ/EBqswCUpZjuVFZcMFBR4ZXA0c=;
 b=jPIyrkQiGDbi3xcB+wPr34WQcfntKoDvbPuU60XSKx4F8IblnVJBWeHX1/1n+/iQ0g
 vvjRnu4te0A4osICcy9k+YsnwLDgo2NmjJG1VN1yUQ5xutdMjA+ctuYSrXTEn+FdcX1u
 mPhmrVjABeP13eEVEjZLKRNA47QN1zp96UBVT6Tz8l/uNTEdx+T6n/iMlyJ+08e9RkM4
 UYwZaf/7AyhmyT4LsE3r0Sffq32eW/I4YR2qiTBZ8r7eO0NCdn2oBnafm+LG/7fMhXza
 DvixQaIZf96sMSBEKkG4a9t1GSQiD4CbNLFXfh8Lzk1ZTMhQbS9ZnQip30cRw7AKD+ie
 jq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z4XsQI9r3zgLSCqnQ/EBqswCUpZjuVFZcMFBR4ZXA0c=;
 b=hkejsMQm3eC+LyPmFX/kX9nfkj2VNU5xxF4+6ORNoD9RsPa2BKAiIefPeR5tKDVWik
 KyDwm9iSBfnL7jjsXyy6pPdbHfEfr4x/Y6UJj/7CKf0t0l38Qs8PO9ruJhNYKxUH7636
 xt8vxRf235wwnscPa6FvA9rCeBldh0iZKabl45sNgfRFGavWY4hM6iYWEHojQxrMxlDR
 ciRFHx9FbFfGTncyxmLHaezL/OJAgK1OG6B0u5sDyi3d+VWRJzi2CwGJTmdK5gVkpsLs
 f/yA0lRSvBhjpGesSftXmFConQLUPysArrAuHM3zcyDNwgqVctOVhOGHA+HweMHbVAb3
 q4Wg==
X-Gm-Message-State: APjAAAXyXJSp4S/fXUCemS1ngOQAVpQAVDDdRRz8pS/EbWWHuLTLj21f
 7UNbkG22WJDdJda3MkhSBQoGiw==
X-Google-Smtp-Source: APXvYqy/FnDivULLxZ2Wc9B3BXXFhEFNfqa3GnLUyjOrJkfRR3rVJTddV2nFa79laoonnwV0Sce3mg==
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr75023837lje.7.1561464277190; 
 Tue, 25 Jun 2019 05:04:37 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id q21sm996152lfc.96.2019.06.25.05.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 05:04:35 -0700 (PDT)
Date: Tue, 25 Jun 2019 04:36:57 -0700
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: dts changes for 5.3
Message-ID: <20190625113657.uiy7ytcotn57hq3r@localhost>
References: <CACPK8XfMEzqvTGZz7JZxz0XQ0tBHzpJRDxtCEFB-ZzKCyDeuQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfMEzqvTGZz7JZxz0XQ0tBHzpJRDxtCEFB-ZzKCyDeuQw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: arm <arm@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 07:34:16AM +0000, Joel Stanley wrote:
> Hello ARM maintainers,
> 
> Here's the ASPEED device tree changes for 5.3. Most of the patches
> have been baking for a number of weeks, with a few late changes added
> in today.
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.3-devicetree
> 
> for you to fetch changes up to 6084110a0e9c4bff75970f3d68091ceff9e2c2c7:
> 
>   ARM: dts: aspeed: Enable video engine on romulus and wtherspoon
> (2019-06-20 16:37:26 +0930)
> 
> ----------------------------------------------------------------
> ASPEED device tree updates for 5.3
> 
> We have various device tree updates from the OpenBMC project to enable
> bits and pieces in existing systems, notably updates to Google's Zaius.
> 
> There are some AST2500 machines under development:
> 
>   * Lenovo Hr630
>   * IBM Swift
>   * Facebook YAMP
> 
> And some AST2400 machines that have been around but out of tree and have
> now joined the party:
> 
>   * YADRO VESNIN
>   * Microsoft Olympus

Merged, thanks!


-Olof
