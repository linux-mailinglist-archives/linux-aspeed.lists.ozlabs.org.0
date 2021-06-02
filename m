Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF539807F
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Jun 2021 06:54:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvxX605vLz302H
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Jun 2021 14:54:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 420 seconds by postgrey-1.36 at boromir;
 Wed, 02 Jun 2021 14:49:04 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvxPr1tmgz2yRS
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Jun 2021 14:49:03 +1000 (AEST)
Received: by codeconstruct.com.au (Postfix, from userid 10001)
 id EE5F22194F; Wed,  2 Jun 2021 12:42:01 +0800 (AWST)
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i2c@vger.kernel.org,
	matt@codeconstruct.com.au
Subject: [RFC PATCH 0/3] Increase SMBus max block size to 255
Date: Wed,  2 Jun 2021 12:41:10 +0800
Message-Id: <20210602044113.1581347-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Jun 2021 14:54:26 +1000
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
Cc: jk@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch series increases the SMBus max block size from 32 to 255
as per the SMBus 3.0 specification.

Userspace remains backwards compatible with the current 32 byte block
for the I2C_SMBUS ioctl, and the block size limit remains for I2C_RDWR
ioctl with I2C_M_RECV_LEN.

It is separated into patches 1 & 2 though the userspace API isn't
correct with only the first patch - maybe they should be squashed. The
stack buffers in i2c_smbus_xfer_emulated() increase from ~70 bytes to
~500 bytes - I'm not sure if that is a problem.

I have tested with the Aspeed I2C controller, other drivers can add the
functionality as needed. For most emulated drivers it looks like minimal
changes are required.

This is required for MCTP I2C transport which has a 64 byte baseline
packet size.

Cheers,
Matt

Matt Johnston (3):
  i2c: core: Allow 255 byte transfers for SMBus 3.x
  i2c: dev: Handle 255 byte blocks for i2c ioctl
  i2c: aspeed: allow 255 byte block transfers

 drivers/i2c/busses/i2c-aspeed.c |  5 +-
 drivers/i2c/i2c-core-smbus.c    | 20 ++++---
 drivers/i2c/i2c-dev.c           | 92 ++++++++++++++++++++++++++++-----
 include/linux/i2c.h             | 13 +++++
 include/uapi/linux/i2c-dev.h    |  2 +
 include/uapi/linux/i2c.h        |  7 ++-
 6 files changed, 115 insertions(+), 24 deletions(-)

-- 
2.30.2

