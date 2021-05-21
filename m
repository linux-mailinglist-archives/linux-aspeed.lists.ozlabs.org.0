Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A40738C8FF
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 May 2021 16:13:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmpVj2RPrz308g
	for <lists+linux-aspeed@lfdr.de>; Sat, 22 May 2021 00:13:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.a=rsa-sha256 header.s=ds202012 header.b=bILOGlht;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tronnes.org (client-ip=2a01:5b40:0:3005::1;
 helo=smtp.domeneshop.no; envelope-from=noralf@tronnes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tronnes.org header.i=@tronnes.org header.a=rsa-sha256
 header.s=ds202012 header.b=bILOGlht; dkim-atps=neutral
X-Greylist: delayed 240 seconds by postgrey-1.36 at boromir;
 Sat, 22 May 2021 00:13:28 AEST
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmpVc4Jrfz300P
 for <linux-aspeed@lists.ozlabs.org>; Sat, 22 May 2021 00:13:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mzxTAoQKZErI0PSlV6Tx+3ILAHO7jFNRjBMhpv39Rlg=; b=bILOGlhtsDznJmhl3TFXvnvplE
 Ixe5T9HBrMiDZAMMx686k9FpKn1MoqOli+IjA8R8W5lHgPq/6V5gQAy0cvXVppCuGncYVYXrfJ1iA
 mDTQj4RQ0x2cVmKxxqif50mnzTNJd1YW5eYwJwKp0Ls9DwseAh9+YEu/yXcVzyi/ZHKjxENmXmIsj
 jJua4+BnHtIVIU6l/fRg8ZFtLHYf2pkbwZwOlWiMbiYsR03CkDUc5iDBh+KZW/j2/rKY1cGCxELJy
 qUoNtLvmohAEWOPP9E7yLiBxq7gf6X4HjlOOtsTm5+Jf46IQdc8hXtE1zPrKNoHY/NCKNzIbW8tjL
 fJseoIJg==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=50828)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lk5q6-0005ru-3Q; Fri, 21 May 2021 16:09:22 +0200
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
Date: Fri, 21 May 2021 16:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



Den 21.05.2021 11.09, skrev Daniel Vetter:
> Goes through all the drivers and deletes the default hook since it's
> the default now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Noralf Trønnes <noralf@tronnes.org>
