Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D458B5A7354
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 03:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHRPD5KJGz3bqn
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 11:27:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vxenx/x3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vxenx/x3;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGQtT3WRFz3bZ2
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Aug 2022 20:00:47 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id bs25so9504934wrb.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Aug 2022 03:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=l0dd8ecbpZnuzsCu5JGEpd3FIwlZH2NjRr90vsXjRJU=;
        b=Vxenx/x3aciurxig2M6JStt1bFKy9byWFgerDbAaMMmGHP5hv1Zv4mhoRvPo+RU0rj
         3xUO7ahTZi2vegvvvjlSv+HbTYM4nUGlWqK1jJD/n00UYVtxad9hsM3DtjjLw+gV8HII
         2c1EFG3PGwSwVukbr1Ma3AGbzLEh+dAhUN6XeLsfBhp7ce/2WFobApiKPQsXw12wBh7e
         2vaHtkJYxTMzCIvoK4I9rwI6A+2hGzMpYu3mv6UC28SvgrhGOIcnr4EU3Aelhl6yoEXK
         jwfMbaYzS54AfqgtbevJedt76ZY24iaACODyX/I0ysJIUBzqf0ws+wRJL1xp4MDHMwjp
         DcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=l0dd8ecbpZnuzsCu5JGEpd3FIwlZH2NjRr90vsXjRJU=;
        b=3SltdR1x5cMZewDbUht2UoFM0Ehng8sZtDOkbX0byfHpvHAsElTZ92+iPO3UrA3jcO
         J96fQI3c71HLvg+4tGASAWrqdKyRmTCHFTp/+i3Hr3XEdePJQ8MiCtdlry8JgiDuCKlm
         MhFvl+8dkdG/vfkZVeL3gLwGp1fmGK4xey/IDAmikmWzjY1UjxvX1dKba2MazHQGx6ac
         S2X0exclPfxc+a9+8rGGetikTVZNyJq42FXqq53jLiQWY/frxbT9aR7NftKeuWOoCdsz
         o9gAjR4uA+QkbznxYwkIXZ5r+ix/qSB1tUEtAsppN5fvceqWEa8zSxSoPn4xWDkuV8ys
         Krbg==
X-Gm-Message-State: ACgBeo2QWLdw19scRlhvC5IlhugO4DHk9xWb1D1fIzoETLZqRYHN/jTm
	xYVeU1LST6le284xRy5s1iY=
X-Google-Smtp-Source: AA6agR7p1BSAyfx0TInY5Ker3Q46WxaH2F9v+jEvrWs9zSmBL9VOugQdt15Cdyt5riIsyGP3mdmBrA==
X-Received: by 2002:a5d:4082:0:b0:226:d019:c91e with SMTP id o2-20020a5d4082000000b00226d019c91emr5941444wrp.557.1661767241168;
        Mon, 29 Aug 2022 03:00:41 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc015000000b003a5c999cd1asm8881424wmb.14.2022.08.29.03.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 03:00:40 -0700 (PDT)
Date: Mon, 29 Aug 2022 11:00:38 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Johnny Huang <johnny_huang@aspeedtech.com>,
	Dhananjay Phadke <dphadke@linux.microsoft.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: build failure of next-20220829 due to 108713a713c7 ("crypto: aspeed
 - Add HACE hash driver")
Message-ID: <YwyORp72cuDrVYdA@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:27:25 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi All,

The builds of arm allmodconfig have failed to build next-20220829 with
the error:

ERROR: modpost: "aspeed_register_hace_hash_algs" [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
ERROR: modpost: "aspeed_unregister_hace_crypto_algs" [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
ERROR: modpost: "aspeed_register_hace_crypto_algs" [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
ERROR: modpost: "aspeed_unregister_hace_hash_algs" [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!


git bisect pointed to 108713a713c7 ("crypto: aspeed - Add HACE hash driver")

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
