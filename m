Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE138DEDF
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 May 2021 03:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpKKd3FJSz308w
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 May 2021 11:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lechnology.com header.i=@lechnology.com header.a=rsa-sha256 header.s=default header.b=hmX2PqtA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lechnology.com (client-ip=98.142.107.122; helo=vern.gendns.com;
 envelope-from=david@lechnology.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lechnology.com header.i=@lechnology.com
 header.a=rsa-sha256 header.s=default header.b=hmX2PqtA; 
 dkim-atps=neutral
X-Greylist: delayed 1214 seconds by postgrey-1.36 at boromir;
 Sat, 22 May 2021 00:02:06 AEST
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmpFV0NcKz305t
 for <linux-aspeed@lists.ozlabs.org>; Sat, 22 May 2021 00:02:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9lP4cKqfXHid5MksziM3FSc3DFRksG808KiNvq/BVYE=; b=hmX2PqtAcvfv2cTaWaKqbBzYnw
 DxSzvIsTFnCd9Ad9cdgXcoZVPVp+Z0y4/scrHZ6lQs88LnWXAa1YT4bs9Ia475q2X9vr1EOloNLCE
 THXs6NcMbbEEyxq3reOMRol8oP6jgXycuu8nbCc+4m9ZxjpBaxuPlbxnbeqkFLH5sNb79jTHyusGn
 Aj53qnao2AuiRFV92GruAtnjQKtCSKCaf2iZEz2O8VAEap+BHfbNyR/Ot54sQ9hGJPQZPKsE8tb7U
 0yMzptP6/L6YqlsKaZ6pc6CV/OvWHV6P877WAEb11FA4+jFhLuJ5+9IAG3jPixiqPaX93WGLZqRzV
 iYx9lswA==;
Received: from [2600:1700:4830:165f::fb2] (port=60256)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1lk5P6-0003HQ-MU; Fri, 21 May 2021 09:41:41 -0400
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: David Lechner <david@lechnology.com>
Message-ID: <15839b4b-04e5-c65a-8e7c-6e1bdce9757f@lechnology.com>
Date: Fri, 21 May 2021 08:41:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Mon, 24 May 2021 11:24:54 +1000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/21/21 4:09 AM, Daniel Vetter wrote:
> Goes through all the drivers and deletes the default hook since it's
> the default now.

Acked-by: David Lechner <david@lechnology.com>

