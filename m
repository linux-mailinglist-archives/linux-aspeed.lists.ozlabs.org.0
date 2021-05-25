Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297E390630
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 May 2021 18:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqJpp0QLRz2yxj
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 May 2021 02:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=B3DENF8e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=B3DENF8e; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqJpf4wlSz2yWK
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 May 2021 02:05:59 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id i17so32811241wrq.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 May 2021 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
 b=B3DENF8eoHhecWAFNQVLS2JEamnemU33gyvaAri/jUlxzebGZ65BPV0vBbEDgtL0i2
 ktvkA4hfm35xWOsU0Qpu7M/Khpm+8vhn3XskgiCo4rDbB3tRmN4WHjCEACwUXqYx4FeY
 Jtta5hNrcC+yqioS0IajWgJ26ctB5Cv70tzOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
 b=QqmzBEebQeXz+DkIv5TnA48u/xdX0QMjrScdM2OPw/43gughTDeIjgHkQ2WcWGailt
 2M5c+/661haM14VWCT9BTjkY7CQ7cWrvYvNoCR9cOHw+u1EcC+CG7eSqNsODcxS/TB5f
 D7R2BL/9wS1qEl8TyTi7G6nGRJW5vpv/GGB/nXhKf6oe8ixslT+LveParThdZVJ5SC5f
 QwkSsQ7eWExb3OTTHTK7GGh66NdFhdC9sLIGbF6Z2f9u9zjczeC1Wr528uw0nFcvz+p8
 p8ryIJgGWH6+0eCO68yqBgjoBcYoSb6NycVie/Ll403gde90rMcRnpK1ijg2x7H6DaxC
 OMvQ==
X-Gm-Message-State: AOAM531ax+0NTanqWdjEBj6Zr1/gSc10IldG61DKlL2icWf4hx141ZUk
 JswXRXUQFa0dHAPeXMzYv+Q43w==
X-Google-Smtp-Source: ABdhPJzmCQM+KdUAXONpPffkFRK0K5WklaT15aqWUiMtaXWooOfXUGpF52ocgwjNDKESzlRppx+OrQ==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr28170569wru.90.1621958753771; 
 Tue, 25 May 2021 09:05:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm11169638wmq.1.2021.05.25.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:05:52 -0700 (PDT)
Date: Tue, 25 May 2021 18:05:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb
 is the default
Message-ID: <YK0gXjANguasJLu5@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
 <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 04:09:13PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 21.05.2021 11.09, skrev Daniel Vetter:
> > Goes through all the drivers and deletes the default hook since it's
> > the default now.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Noralf Trønnes <noralf@tronnes.org>

Can you perhaps also look at the prep patch right before this one?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
