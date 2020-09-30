Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5427EFBF
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Sep 2020 18:54:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1j5w5qMlzDqQF
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Oct 2020 02:54:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gIyzm/LM; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1j5n2hN1zDq5f
 for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Oct 2020 02:54:20 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id q4so100538pjh.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Sep 2020 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a+511h/yRt0hAA530rhVf+uoJRBXRfwSraxYw7O/kA4=;
 b=gIyzm/LMhzk6FmcrH/7F0RNZbSSNuIox03V/NLAc7uhQqZOnGw/v9WAuwtjpk4/RQY
 XEpq9jhXtvSdVu94k5qKQOY3C5IEKNbbw5Bvf0KfJCtDCzFqXGNuWsXiBHXvhWSYSSLC
 LkMgyB5FEeg5osBePET6/2KYORZWx7FaA54whxElkY+wMODcQ1mWmgEF2rxIa99COPLs
 Du3GQhn5WOMk1QnHxrVk5fyHenVzPaJ0WuPTdRshqMsDj6smYr400lgsVHYIVG7f+CUd
 tufeR0zq0+xx5Dw9a5Qx6WFxekg7M+70Da60wDPBpZoBeb7pSlWA/U1MmPVaLKhnBN7t
 WukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a+511h/yRt0hAA530rhVf+uoJRBXRfwSraxYw7O/kA4=;
 b=lcu62YrxPS/Y/Id4d6ieFxh7RCfO8r3lendbPy5XeDbGolKIRyxHIaC76GECP4w7qD
 /sTsH33k4azr4Kfi/+ORAF2CmPwlxMJwND5U9iid0CUw9JUpN9e6wtZmRrbyG5TLyFzt
 ldaCEKkAQQ7BojJ/Q6hYvQwiBWRqPG9d92QdPXMGFNeWeM4hoy0Fb0Xk7RWJ4VPXfl7A
 q8a+A1GXQZ7Z0fQgOhnI6S4e/f1D0Q1IW+Dc0xOsyOZppN/7xdK2KyqO/m3qx/GOgH1L
 Iru9mtnp0St1IognsqetM4KF+CX2qxLB6SapFUU0QhEb7ldwECLi6tE1qv1L8+4E/Yaf
 oURw==
X-Gm-Message-State: AOAM532FWztVanJuMK9QTuzp0U144zdX8cZp6iNc7EHCvwr6iLgm7JBm
 NOXr+wgKX3sQUs28qrgw5flQhlEi2DBB7c4C
X-Google-Smtp-Source: ABdhPJxwezn+YlJ0I0Lsa/QSD/QW96cOmMj3PWOOxNwHQmumz6Lo0kuB7h+fFEjaG5LEvcuSBTpVLg==
X-Received: by 2002:a17:90a:bc08:: with SMTP id
 w8mr3317041pjr.168.1601484855301; 
 Wed, 30 Sep 2020 09:54:15 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id l141sm2960368pfd.47.2020.09.30.09.54.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 09:54:14 -0700 (PDT)
Date: Wed, 30 Sep 2020 09:54:12 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 3/3] ARM: dts: add ehci uhci enable in evb dts
Message-ID: <20200930165411.GC25872@taoren-ubuntu-R90MNF91>
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 30, 2020 at 12:08:23PM +0800, Ryan Chen wrote:
> Add EHCI UHCI enable build in aspeed-ast2600-evb.dts
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
