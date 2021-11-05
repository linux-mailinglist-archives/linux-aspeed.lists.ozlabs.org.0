Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C0446834
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 18:59:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm7ZC5HPkz30RK
	for <lists+linux-aspeed@lfdr.de>; Sat,  6 Nov 2021 04:59:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=H3jiklJ/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=H3jiklJ/; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm7Ym6Pv3z307W
 for <linux-aspeed@lists.ozlabs.org>; Sat,  6 Nov 2021 04:59:22 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id i5so14990500wrb.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 05 Nov 2021 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tGkFto0SREmSqUA5YI0n/LIXjjGKHRviX7CKssvc+BM=;
 b=H3jiklJ/Y/eada1RvgM3UfPQsPX0by+cBlb6mu+HZpANjjDP2EAco1y7vZs0KY5Z3K
 C8MdQ3+I5NEL9N/8IXXGyNI+uyZ82MNp7mVpaN4cTft5wEm0pU8+BSK0UHCLXzGllUnZ
 noFTpfuPfo5PmpoXi87sKvb6OeEHMYA2hz+qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tGkFto0SREmSqUA5YI0n/LIXjjGKHRviX7CKssvc+BM=;
 b=w3VUM7Cd26MuXLjWNLwvo0Kn16D9yuQvsENw4XaTN8XHnj0Lz88NJrZz8xjN8SduPr
 7WgR/JZowJwALQc1Ba4QqZlIwkpCqQID6LWI+tV6jAA8BpN0eUK3UyJAZh7j3yLTplRP
 Z1n/uS3U79v7wNlgwORhMZTgRyLQ9xAtZTcQFULSdorAjKt7vcABhv4I1KzBdMSf6v50
 Y58BXBqdYBvs3t3Osb60PGbe92JJCoijYhquP05Q8ierESslAErZpRJRZQjEyd3e8gz8
 FggkWbZKuxeJnSLjQVvqZXKXMmFkcJOlB2bQurHWdmdQW0uBgrt4Rag2wri4yyR2y3vY
 7Niw==
X-Gm-Message-State: AOAM5334qL2vokrd7gAWAgA9+j9Wo+o2Exvla7B9IlsKJfBq2I7zGdkL
 F9TFzdeO9u66TJNly1wEGRRS6w==
X-Google-Smtp-Source: ABdhPJwNq7bzeIgDFzjtJqF6GB5todXBINJj4e6J3QfytVexB5YUgQf8SyXm53D1wok8LpIRuN/xuA==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr38342127wrr.184.1636135154166; 
 Fri, 05 Nov 2021 10:59:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n7sm8549638wro.68.2021.11.05.10.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:59:13 -0700 (PDT)
Date: Fri, 5 Nov 2021 18:59:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
Message-ID: <YYVw70934dYhyGVZ@phenom.ffwll.local>
References: <20211101081751.24613-3-tzimmermann@suse.de>
 <202111012344.tYv3YxkG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202111012344.tYv3YxkG-lkp@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 airlied@linux.ie, naresh.kamboju@linaro.org, llvm@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, linux-mips@vger.kernel.org,
 mripard@kernel.org, noralf@tronnes.org, marcel@ziswiler.com, daniel@ffwll.ch
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Nov 01, 2021 at 11:59:15PM +0800, kernel test robot wrote:
> Hi Thomas,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on next-20211029]
> [cannot apply to drm/drm-next shawnguo/for-next pinchartl-media/drm/du/next v5.15 v5.15-rc7 v5.15-rc6 v5.15]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Small-CMA-cleanups/20211101-161911
> base:    bdcc9f6a568275aed4cc32fd2312432d2ff1b704
> config: x86_64-randconfig-a004-20211101 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/c3c7ec5f9ccd90e78f0f2d3143505db4060bbf17
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Thomas-Zimmermann/drm-Small-CMA-cleanups/20211101-161911
>         git checkout c3c7ec5f9ccd90e78f0f2d3143505db4060bbf17
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from namespace DMA_BUF, but does not import it.
> >> ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from namespace DMA_BUF, but does not import it.

I guess this is simply because kbuild tests on top of linux-next, where
the namespacing is a bit funny. We might need a fixup when we backmerge.

Either way this looks like a good simplification to me, on the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
